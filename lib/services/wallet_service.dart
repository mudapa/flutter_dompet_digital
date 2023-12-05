import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'auth_service.dart';

class WalletService {
  // update pin
  Future<void> updatePin(String oldPin, String newPin) async {
    try {
      // get token
      final token = await AuthService().getToken();

      // request
      final res = await http.put(
        Uri.parse(
          '${dotenv.env['BASE_URL']}/wallets',
        ),
        body: {
          'previous_pin': oldPin,
          'new_pin': newPin,
        },
        headers: {
          'Authorization': token,
        },
      );

      // check status code
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
