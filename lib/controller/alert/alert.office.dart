import 'dart:developer';
import 'dart:io';
import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<http.Response?> getNotification() async {
  http.Response? response;
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString(tokenKey);

  try {
    response = await http.get(
      Uri.parse('$baseUrl/crypto/notification'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    ).timeout(const Duration(seconds: 30));

    print(response.body.toString());
  } catch (e) {
    response = null;
  }
  return response;
}
