import 'package:crypto_credit/controller/update_user_info/update_avatar/avatar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'avatar_office.dart';

class AvatarWare extends ChangeNotifier {
  bool _loadStatus = false;
  String _message = 'Something went wrong';
  String _avatar = "";
  SharedPreferences? _pref;
  SharedPreferences get pref => _pref!;
  String get message => _message;

  bool get loadStatus => _loadStatus;
  String get avatarUrl => _avatar;

  Future addAvatarUrl(String url) async {
    _avatar = url;
  }

  Future<void> isLoading(bool isLoad) async {
    _loadStatus = isLoad;
    notifyListeners();
  }

  Future<bool> updateAvatarFromApi(
    AvatarModel body,
  ) async {
    late bool isSuccessful;

    try {
      http.StreamedResponse? response = await updateAvatar(body)
          .whenComplete(() => log("avatar request done"));
      if (response == null) {
        _message = "Something went wrong";
        isSuccessful = false;
      } else if (response.statusCode == 200) {
        final res = await http.Response.fromStream(response);
        var jsonData = jsonDecode(res.body);
        log(jsonData.toString());
        _message = "Updated Successfully";
        _avatar = jsonData["avatar"].toString();
        isSuccessful = true;
      } else {
        final res = await http.Response.fromStream(response);
        var jsonData = jsonDecode(res.body);
        _message = "Update Failed";
        log(jsonData.toString());
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
    }

    notifyListeners();

    return isSuccessful;
  }
}
