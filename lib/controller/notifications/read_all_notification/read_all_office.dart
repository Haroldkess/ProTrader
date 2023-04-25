import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<http.Response?> readAllNotifications() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString(tokenKey);
  final data = {"user_id": pref.getString(userIdKey)};
  http.Response? response;
  try {
    response =
        await http.post(Uri.parse('$baseUrl/crypto/notification/read-all'),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer $token",
            },
            body: jsonEncode(data));
    log(response.body.toString());
  } catch (e) {
    response = null;
  }
  return response;
}

Future<http.Response?> getSingleNotification(String positionName) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString(tokenKey);

  http.Response? response;
  try {
    response = await http.post(
      Uri.parse('$baseUrl/crypto/get-positions?symbol=$positionName'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    log(response.body.toString());
  } catch (e) {
    response = null;
  }
  return response;
}
