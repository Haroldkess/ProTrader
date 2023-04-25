import 'dart:developer';

import 'package:crypto_credit/controller/update_user_info/update_password/password_model.dart';
import 'package:crypto_credit/controller/update_user_info/update_password/password_ware.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../views/widgets/custom_alerts.dart';

class UpdatePasswordController {
  static Future<void> updatePassword(BuildContext context, String old, String newPass, String confirm) async {
    PasswordWare ware = Provider.of<PasswordWare>(context, listen: false);
    PasswordModel data = PasswordModel(old: old, newPass: newPass, confirm: confirm);

    ware.isLoading(true);

    bool isDone = await ware
        .updatePasswordFromApi(data)
        .whenComplete(() => log("everything from api and provider is done"));

    if (isDone) {
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
