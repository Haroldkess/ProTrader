import 'dart:convert';

import 'package:crypto_credit/controller/two_fa/send_token_model.dart';
import 'package:crypto_credit/controller/two_fa/two_fa_office.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../service_locator.dart';
import '../network_logic/apis.dart';
import '../network_logic/network_calls.dart';

class TwoFactorWare extends ChangeNotifier {
  bool _loadStatus = false;
  bool _loadStatus2 = false;
  String _msg = "";
  String _msg2 = "";

  bool get loadStatus => _loadStatus;
  String get msg => _msg;
  bool get loadStatus2 => _loadStatus2;
  String get msg2 => _msg2;

  void isLoad(bool loading) => {_loadStatus = loading, notifyListeners()};
  void isLoad2(bool loading) => {_loadStatus2 = loading, notifyListeners()};

  Future<bool> verifyTwoFa(SendTwoFaModel tok) async {
    late bool isSuccessful;
    var url = NetworkConstants.verifyTwoFa;

    try {
      http.Response? response = await TwoFaCalls.verifyTwoFaFromBackend(tok);

      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 201) {
        var jsonData = jsonDecode(response.body);
        _msg = jsonData["message"];
        isSuccessful = true;
      } else {
        var jsonData = jsonDecode(response.body);
        _msg = jsonData["message"];
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
    }

    notifyListeners();
    return isSuccessful;
  }

  Future<bool> resetTwoFa() async {
    late bool isSuccessful;

    try {
      http.Response? response = await TwoFaCalls.resetTwoFaFromBackend();
      if (response == null) {
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData["data"]["status"] == 422) {
          //  print(jsonData["data"]["data"]["message"]);
          _msg2 = jsonData["data"]["data"]["message"];
        } else {
          _msg2 = "Two factor enabled";
        }

        isSuccessful = true;
      } else {
        var jsonData = jsonDecode(response.body);

        if (jsonData["data"]["status"] == 422) {
          _msg2 = jsonData["data"]["data"]["message"];
        } else {
          _msg2 = "Failed to enable Two factor ";
        }

        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
    }

    notifyListeners();
    return isSuccessful;
  }
}
