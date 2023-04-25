import 'dart:developer';

import 'package:crypto_credit/controller/update_user_info/update_username/username_post_model.dart';
import 'package:crypto_credit/controller/update_user_info/update_username/username_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../views/widgets/custom_alerts.dart';
import 'bind_provider.dart';
import 'send_bind_model.dart';

class BindController {
  static Future<void> attemptBinds(
      BuildContext context, String x, String y, String i) async {
    BindWare ware = Provider.of<BindWare>(context, listen: false);
    SendBindKey apiData = SendBindKey(
        id: i,
        exchanges: Exchanges(
            bianance: Bianance(
          apiPrivateKey: y,
          apiPublicKey: x,
        )));

    ware.isLoading(true);

    bool isDone = await ware
        .sendBindsFromApi(apiData)
        .whenComplete(() => log("everything from api and provider is done"));

    if (isDone) {
      ware.saveApis(x, y);
      ware.isLoading(false);
      // ignore: use_build_context_synchronously
      showToast(context, ware.message, isError: false);
      // ignore: use_build_context_synchronously
      // Navigator.pop(context);
    } else {
      ware.isLoading(false);

      // ignore: use_build_context_synchronously
      showToast(context, ware.message, isError: true);
    }
  }
}
