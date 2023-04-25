import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:crypto_credit/controller/two_fa/send_token_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../network_logic/apis.dart';

class TwoFaCalls {
  static Future<http.Response?> verifyTwoFaFromBackend(
      SendTwoFaModel tok) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    var url = "$baseUrl/${NetworkConstants.verifyTwoFa}";
    print(url);

    http.Response? response;
    try {
      response = await http
          .post(Uri.parse(url),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader: "Bearer $token",
              },
              body: jsonEncode(tok.toJson()))
          .timeout(const Duration(seconds: 30));

      log(response.body.toString());
    } catch (e) {
      response = null;
    }
    return response;
  }

  static Future<http.Response?> resetTwoFaFromBackend() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    var url = "$baseUrl/${NetworkConstants.resetTwoFa}";
    print(url);

    http.Response? response;
    try {
      response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      ).timeout(const Duration(seconds: 30));

      log(response.body.toString());
    } catch (e) {
      response = null;
    }
    return response;
  }
}
