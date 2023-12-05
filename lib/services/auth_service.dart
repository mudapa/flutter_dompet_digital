import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/sign_in_model.dart';
import '../models/sign_up_model.dart';
import '../models/user_model.dart';

class AuthService {
  // check email
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
        Uri.parse(
          '${dotenv.env['BASE_URL']}/is-email-exist',
        ),
        body: {
          'email': email,
        },
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['error'];
      }
    } catch (e) {
      rethrow;
    }
  }

  // register
  Future<UserModel> register(SignUpModel data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '${dotenv.env['BASE_URL']}/register',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  // login
  Future<UserModel> login(SignInModel data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '${dotenv.env['BASE_URL']}/login',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  // logout
  Future<void> logout() async {
    try {
      final token = await getToken();

      final res = await http.post(
        Uri.parse(
          '${dotenv.env['BASE_URL']}/logout',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        await clearLocalStorage();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  // storeCredentialToLocal
  Future<void> storeCredentialToLocal(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(
        key: 'token',
        value: user.token,
      );
      await storage.write(
        key: 'email',
        value: user.email,
      );
      await storage.write(
        key: 'password',
        value: user.password,
      );
    } catch (e) {
      rethrow;
    }
  }

  // get data from local
  Future<SignInModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['email'] == null && values['password'] == null) {
        throw 'authenticated';
      } else {
        final SignInModel data = SignInModel(
          email: values['email']!,
          password: values['password']!,
        );
        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  // get Token
  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = 'Bearer $value';
    }

    return token;
  }

  // clear local storage
  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
