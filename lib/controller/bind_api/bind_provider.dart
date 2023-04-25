import 'dart:convert';
import 'dart:developer';
import 'package:crypto_credit/controller/bind_api/bind_office.dart';
import 'package:crypto_credit/controller/bind_api/send_bind_model.dart';
import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BindWare extends ChangeNotifier {
  String _publicKey = "";
  String _secretKey = "";
  String _message = "";
  String _userId = "";

  bool _loadStatus = false;
  SharedPreferences? _pref;
  SharedPreferences get pref => _pref!;
  String get publicKey => _publicKey;
  String get secretKey => _secretKey;
  String get message => _message;
  bool get loadStatus => _loadStatus;
  String get userId => _userId;

  Future<void> initPref() async {
    _pref = await SharedPreferences.getInstance();
    notifyListeners();
  }

  Future<void> saveId(String i) async {
    await initPref();

    if (_pref == null) return;
    _userId = i;
    _pref!.setString(userIdKey, i);
    notifyListeners();
  }

  void addKeys(String p, String s) {
    _publicKey = p;
    _secretKey = s;
    notifyListeners();
  }

  void isLoading(bool l) {
    _loadStatus = l;
    notifyListeners();
  }


  Future<void> saveApis(String p, String s) async {
    await initPref();

    if (_pref!.containsKey(publicKey) && pref.containsKey(secretKey)) {
      _publicKey = p;
      _secretKey = s;
      _pref!.setString(publicKey, p);
      _pref!.setString(secretKey, s);
    } else {
      _publicKey = p;
      _secretKey = s;
      _pref!.setString(publicKey, p);
      _pref!.setString(secretKey, s);
    }

    notifyListeners();
  }

  Future<bool> sendBindsFromApi(
    SendBindKey body,
  ) async {
    late bool isSuccessful;

    try {
      http.Response? response = await cryptoBindApi(body)
          .whenComplete(() => log("bind request done"));
      if (response == null) {
        _message = "Something went wrong";
        isSuccessful = false;
        //  log("username  request failed");
      } else if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        _message = jsonData["message"].toString();

        isSuccessful = true;
      } else {
        var jsonData = jsonDecode(response.body);
        _message = jsonData["message"].toString();

        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
    }
    notifyListeners();
    return isSuccessful;
  }
}
