import 'dart:developer';

import 'package:crypto_credit/controller/update_user_info/update_phone/phone_model.dart';
import 'package:crypto_credit/controller/update_user_info/update_phone/phone_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../views/widgets/custom_alerts.dart';

class UpdatePhoneController {
  static Future<void> updatePhone(BuildContext context, String phone) async {
    PhoneWare ware = Provider.of<PhoneWare>(context, listen: false);
    PhoneModel data = PhoneModel(phone: phone);

    ware.isLoading(true);

    bool isDone = await ware
        .updatePhoneFromApi(data)
        .whenComplete(() => log("everything from api and provider is done"));

    if (isDone) {
      ware.isLoading(false);
      ware.savePhone(phone);

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
