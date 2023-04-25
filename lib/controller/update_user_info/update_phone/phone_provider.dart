import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:crypto_credit/controller/update_user_info/update_phone/phone_model.dart';
import 'package:crypto_credit/controller/update_user_info/update_phone/phone_office.dart';
import 'package:crypto_credit/controller/update_user_info/update_username/username_office.dart';
import 'package:crypto_credit/controller/update_user_info/update_username/username_post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PhoneWare extends ChangeNotifier {
  bool _loadStatus = false;
  String _message = 'Something went wrong';
  String _phone = "";
  SharedPreferences? _pref;
  SharedPreferences get pref => _pref!;
  String get message => _message;

  bool get loadStatus => _loadStatus;
  String get phone => _phone;

  Future initPref() async {
    _pref = await SharedPreferences.getInstance();
    notifyListeners();
  }

  Future<void> savePhone(String data) async {
    await initPref();

    if (_pref!.containsKey(phoneKey)) {
      _phone = data;
      _pref!.setString(phoneKey, data);
    } else {
      _pref!.setString(phoneKey, data);
      _phone = data;
    }

    notifyListeners();
  }

  Future<void> isLoading(bool isLoad) async {
    _loadStatus = isLoad;
    notifyListeners();
  }

  Future<bool> updatePhoneFromApi(
    PhoneModel body,
  ) async {
    late bool isSuccessful;

    try {
      http.Response? response =
          await updatePhone(body).whenComplete(() => log("phone request done"));
      if (response == null) {
        _message = "Something went wrong";
        isSuccessful = false;
        //  log("phone  request failed");
      } else if (response.statusCode == 201) {
        var jsonData = jsonDecode(response.body);
        _message = jsonData["message"].toString();
        _phone = jsonData["data"]["phone"].toString();

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
