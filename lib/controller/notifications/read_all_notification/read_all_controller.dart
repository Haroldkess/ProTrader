import 'dart:developer';

import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/controller/notifications/notifications_request.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../views/widgets/custom_alerts.dart';
import 'read_all_provider.dart';

class ReadAllController {
  static Future<void> readAll(BuildContext context) async {
    ReadAllWare ware = Provider.of<ReadAllWare>(context, listen: false);

    ware.isLoading(true);

    bool isDone = await ware
        .readAllFromApi()
        .whenComplete(() => log("everything from api and provider is done"));

    if (isDone) {
      ware.isLoading(false);

      // ignore: use_build_context_synchronously
      showToast(context, "All notifications are marked as read",
          isError: false);
      // ignore: use_build_context_synchronously
      //  Navigator.pop(context);
    } else {
      ware.isLoading(false);

      // ignore: use_build_context_synchronously
      showToast(context, ware.message, isError: true);
    }
  }

  static Future<void> notificationDesc(
      BuildContext context, String positionName, int id) async {
    ReadAllWare ware = Provider.of<ReadAllWare>(context, listen: false);
    ware.clearDesc();
    var url = NetworkConstants.markAsRead(id.toString());
    var e = await get(context: context, url: url, token: $user.accessToken)
        .then((e) {
      fetchAllNotifications();
      //   showToast(context, "Mark As Read");
    });

    ware.isLoading(true);

    bool isDone = await ware
        .getSingleNotificationFromApi(positionName)
        .whenComplete(() => log("everything from api and provider is done"));

    if (isDone) {
      ware.isLoading(false);

      // ignore: use_build_context_synchronously
      // showToast(context, "All notifications are marked as read",
      //     isError: false);
      // ignore: use_build_context_synchronously
      //  Navigator.pop(context);
    } else {
      ware.isLoading(false);

      // ignore: use_build_context_synchronously
      showToast(context, ware.message, isError: true);
    }
  }
}
