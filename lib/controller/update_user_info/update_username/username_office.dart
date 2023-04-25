import 'dart:developer';
import 'dart:io';
import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:crypto_credit/controller/update_user_info/update_username/username_post_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<http.Response?> updateUsername(UsernameModel data) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString(tokenKey);
  log(token!);
  http.Response? response;
  try {
    response = await http.post(
      Uri.parse(
          '$baseUrl/core/profile/update-profile?username=${data.userName}'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      //  body: jsonEncode(data.toJson())
    );

    log(response.body.toString());
  } catch (e) {
    response = null;
  }
  return response;
}
