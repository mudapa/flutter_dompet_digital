import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/user_edit_model.dart';
import 'auth_service.dart';

import 'package:http/http.dart' as http;

class UserService {
  Future<void> updateUser(UserEditModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse(
          '${dotenv.env['BASE_URL']}/users',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
