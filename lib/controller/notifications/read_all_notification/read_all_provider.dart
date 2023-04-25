import 'package:crypto_credit/controller/notifications/read_all_notification/notification_desc_model.dart';
import 'package:crypto_credit/controller/notifications/read_all_notification/read_all_office.dart';
import 'package:crypto_credit/controller/user_referal/referals_office.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ReadAllWare extends ChangeNotifier {
  bool _loadStatus = false;
  String _message = 'Something went wrong';
  NotificationDescModel notifiDesc = NotificationDescModel();

  String get message => _message;

  bool get loadStatus => _loadStatus;

  Future<void> isLoading(bool isLoad) async {
    _loadStatus = isLoad;
    notifyListeners();
  }

  Future<bool> readAllFromApi() async {
    late bool isSuccessful;
    try {
      http.Response? response = await readAllNotifications()
          .whenComplete(() => log(" readAll request done"));
      if (response == null) {
        _message = "Something went wrong";
        isSuccessful = false;
        //  log("phone  request failed");
      } else if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        isSuccessful = true;
      } else {
        _message = "Something went wrong";
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
    }

    notifyListeners();

    return isSuccessful;
  }

  Future<void> clearDesc() async {
    notifiDesc = NotificationDescModel();

    notifyListeners();
  }

  Future<bool> getSingleNotificationFromApi(String positionNamee) async {
    late bool isSuccessful;
    try {
      http.Response? response = await getSingleNotification(positionNamee)
          .whenComplete(() => log(" readAll request done"));
      if (response == null) {
        _message = "Something went wrong";
        isSuccessful = false;
        //  log("phone  request failed");
      } else if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        var data = NotificationDescModel.fromJson(jsonData);
        notifiDesc = data;

        isSuccessful = true;
      } else {
        _message = "Something went wrong";
        isSuccessful = false;
      }
    } catch (e) {
      isSuccessful = false;
    }

    notifyListeners();

    return isSuccessful;
  }
}
