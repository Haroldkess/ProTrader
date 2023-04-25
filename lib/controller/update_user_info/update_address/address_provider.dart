import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:crypto_credit/controller/update_user_info/update_address/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'address_office.dart';

class AddressWare extends ChangeNotifier {
  bool _loadStatus = false;
  String _message = 'Something went wrong';
  String _country = "";
  String _state = "";
  String city = "";
  SharedPreferences? _pref;
  SharedPreferences get pref => _pref!;
  String get message => _message;

  bool get loadStatus => _loadStatus;

  String get country => _country;
  String get state => _state;
  Future initPref() async {
    _pref = await SharedPreferences.getInstance();
    notifyListeners();
  }

//This stores the country and state of a user locally
  Future<void> saveAddress(String c, String s) async {
    await initPref();
    if (_pref!.containsKey(countryKey) && pref.containsKey(stateKey)) {
      _country = c;
      _state = s;
      _pref!.setString(countryKey, c);
      _pref!.setString(stateKey, s);
    } else {
      _country = c;
      _state = s;
      _pref!.setString(countryKey, c);
      _pref!.setString(stateKey, s);
    }

    notifyListeners();
  }

  Future<void> isLoading(bool isLoad) async {
    _loadStatus = isLoad;
    notifyListeners();
  }

  void addCountry(String country) async {
    _country = country;
    notifyListeners();
  }

  void addState(String state) async {
    _state = state;
    notifyListeners();
  }

  Future<void> addCity(String cty) async {
    city = cty;
    notifyListeners();
  }

  Future<bool> updateAdressFromApi(
    AddressModel body,
  ) async {
    late bool isSuccessful;

    try {
      http.Response? response = await updateAdress(body)
          .whenComplete(() => log("address request done"));
      if (response == null) {
        _message = "Something went wrong";
        isSuccessful = false;
        //  log("address  request failed");
      } else if (response.statusCode == 201) {
        var jsonData = jsonDecode(response.body);
        _message = jsonData["message"].toString();
        _country = jsonData["data"]["country"].toString();
        _state = jsonData["data"]["state"].toString();
        //  log("address  request success");
        isSuccessful = true;
      } else {
        var jsonData = jsonDecode(response.body);
        _message = jsonData["message"].toString();

        //log("address  request failed");
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
      log("address request failed");
      log(e.toString());
    }

    notifyListeners();

    return isSuccessful;
  }
}
