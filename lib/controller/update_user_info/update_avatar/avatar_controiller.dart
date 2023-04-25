import 'dart:developer';
import 'dart:io';

import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:crypto_credit/controller/operations/operation_ware.dart';
import 'package:crypto_credit/controller/update_user_info/update_avatar/avatar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../views/widgets/custom_alerts.dart';
import 'avatar_provider.dart';

class UpdateAvatarController {
  static Future<void> updateAvatar(BuildContext context, File file) async {
    AvatarWare ware = Provider.of<AvatarWare>(context, listen: false);
    OperationWare operation =
        Provider.of<OperationWare>(context, listen: false);
    AvatarModel avatar = AvatarModel(avatar: [file]);
    SharedPreferences pref = await SharedPreferences.getInstance();

    ware.isLoading(true);

    bool isDone = await ware
        .updateAvatarFromApi(avatar)
        .whenComplete(() => log("everything from api and provider is done"));

    if (isDone) {
      pref.setString(profilePhotoKey, operation.addedPhoto!.path);
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
