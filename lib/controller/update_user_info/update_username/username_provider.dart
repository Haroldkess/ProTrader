import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:crypto_credit/controller/update_user_info/update_username/username_office.dart';
import 'package:crypto_credit/controller/update_user_info/update_username/username_post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UsernameWare extends ChangeNotifier {
  bool _loadStatus = false;
  String _message = 'Something went wrong';
  String _userName = "";
  String _name = "";
  SharedPreferences? _pref;
  SharedPreferences get pref => _pref!;

  String get message => _message;

  bool get loadStatus => _loadStatus;
  String get username => _userName;
   String get name => _name;

  Future initPref() async {
    _pref = await SharedPreferences.getInstance();

    notifyListeners();
  }

  Future<void> saveUsername(String data) async {
    await initPref();
    if (_pref!.containsKey(usernameKey)) {
      _userName = data;
      _pref!.setString(usernameKey, data);
    } else {
      _pref!.setString(usernameKey, data);
      _userName = data;
    }

    notifyListeners();
  }
    Future<void> saveName(String data) async {
    await initPref();
    if (_pref!.containsKey(nameKey)) {
      _name = data;
      _pref!.setString(nameKey, data);
    } else {
      _pref!.setString(nameKey, data);
      _name = data;
    }

    notifyListeners();
  }

  Future<void> isLoading(bool isLoad) async {
    _loadStatus = isLoad;
    notifyListeners();
  }

  Future<bool> updateUserNameFromApi(
    UsernameModel body,
  ) async {
    late bool isSuccessful;

    try {
      http.Response? response = await updateUsername(body)
          .whenComplete(() => log("username request done"));
      if (response == null) {
        _message = "Something went wrong";
        isSuccessful = false;
        //  log("username  request failed");
      } else if (response.statusCode == 201) {
        var jsonData = jsonDecode(response.body);
        _message = jsonData["message"].toString();
        _userName = jsonData["data"]["username"].toString();
          _name = jsonData["data"]["name"].toString();

        //   log("username  request success");
        isSuccessful = true;
      } else {
        var jsonData = jsonDecode(response.body);
        _message = jsonData["message"].toString();

        //  log("username  request failed");
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
      //  log("username request failed");
      // log(e.toString());
    }

    notifyListeners();

    return isSuccessful;
  }
}
