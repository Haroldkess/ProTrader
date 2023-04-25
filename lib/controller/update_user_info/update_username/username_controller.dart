import 'dart:developer';

import 'package:crypto_credit/controller/update_user_info/update_username/username_post_model.dart';
import 'package:crypto_credit/controller/update_user_info/update_username/username_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../views/widgets/custom_alerts.dart';

class UpdateUsernameController {
  static Future<void> updateUsername(BuildContext context, String name) async {
    UsernameWare ware = Provider.of<UsernameWare>(context, listen: false);
    UsernameModel username = UsernameModel(userName: name);

    log(username.userName!);

    ware.isLoading(true);

    bool isDone = await ware
        .updateUserNameFromApi(username)
        .whenComplete(() => log("everything from api and provider is done"));

    if (isDone) {
      ware.saveUsername(username.userName!);
      ware.isLoading(false);
      // ignore: use_build_context_synchronously
      showToast(context, ware.message, isError: false);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {
      ware.isLoading(false);

      // ignore: use_build_context_synchronously
      showToast(context, ware.message, isError: true);
    }
  }
}
