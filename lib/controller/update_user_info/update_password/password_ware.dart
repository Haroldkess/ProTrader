import 'package:crypto_credit/controller/update_user_info/update_password/password_model.dart';
import 'package:crypto_credit/controller/update_user_info/update_password/password_office.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PasswordWare extends ChangeNotifier {
  bool _loadStatus = false;
  String _message = 'Something went wrong';

  SharedPreferences? _pref;
  SharedPreferences get pref => _pref!;
  String get message => _message;

  bool get loadStatus => _loadStatus;

  Future<void> isLoading(bool isLoad) async {
    _loadStatus = isLoad;
    notifyListeners();
  }

  Future<bool> updatePasswordFromApi(
    PasswordModel body,
  ) async {
    late bool isSuccessful;

    try {
      http.Response? response = await changePassword(body)
          .whenComplete(() => log("password request done"));
      if (response == null) {
        _message = "Something went wrong";
        isSuccessful = false;
        //  log("phone  request failed");
      } else if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        _message = jsonData["message"].toString();

        // log("phone  request success");
        isSuccessful = true;
      } else {
        var jsonData = jsonDecode(response.body);
        _message = jsonData["message"].toString();

        //   log("phone  request failed");
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
      //  log("phone request failed");
      //  log(e.toString());
    }

    notifyListeners();

    return isSuccessful;
  }
}
