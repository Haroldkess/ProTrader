import 'dart:io';

import 'package:crypto_credit/controller/bind_api/bind_provider.dart';
import 'package:crypto_credit/controller/operations/operation_ware.dart';
import 'package:crypto_credit/controller/theme_modes/theme_provider.dart';
import 'package:crypto_credit/controller/update_user_info/update_avatar/avatar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../keys/pref_keys.dart';
import '../update_user_info/update_address/address_provider.dart';
import '../update_user_info/update_phone/phone_provider.dart';
import '../update_user_info/update_username/username_provider.dart';

class ProjectOperations {
  // check which theme is available from user  and makes adjustments accordingly
  static checkTheme(context) async {
    ThemeAndUtilsProvider theme =
        Provider.of<ThemeAndUtilsProvider>(context, listen: false);
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (!pref.containsKey(themeKey)) return;

    if (pref.getBool(themeKey) == true) {
      theme.changeThemeMode(true);
    } else {
      theme.changeThemeMode(false);
    }
  }

  // checks and stores available user info
  static checkUserInfo(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: use_build_context_synchronously
    AddressWare address = Provider.of<AddressWare>(context, listen: false);
    // ignore: use_build_context_synchronously
    PhoneWare phone = Provider.of<PhoneWare>(context, listen: false);
    // ignore: use_build_context_synchronously
    UsernameWare username = Provider.of<UsernameWare>(context, listen: false);
    // ignore: use_build_context_synchronously
    OperationWare operation =
        Provider.of<OperationWare>(context, listen: false);
    // ignore: use_build_context_synchronously
    BindWare bindWare = Provider.of<BindWare>(context, listen: false);
      // ignore: use_build_context_synchronously
    AvatarWare avatarWare = Provider.of<AvatarWare>(context, listen: false);

    if (pref.containsKey(apiPubKey) && pref.containsKey(apiSecretKey)) {
      bindWare.saveApis(
          pref.getString(apiPubKey)!, pref.getString(apiSecretKey)!);
    }

    if (pref.containsKey(userIdKey)) {
      bindWare.saveId(pref.getString(userIdKey)!);
    }

    if (pref.containsKey(usernameKey)) {
      username.saveUsername(pref.getString(usernameKey)!);
    }

       if (pref.containsKey(nameKey)) {
      username.saveName(pref.getString(nameKey)!);
    }

    if (pref.containsKey(phoneKey)) {
      phone.savePhone(pref.getString(phoneKey)!);
    }
    if (pref.containsKey(profilePhotoKey)) {
      operation.addPhoto(XFile(pref.getString(profilePhotoKey)!));
    }
      if (pref.containsKey(profileUrlKey)) {
      avatarWare.addAvatarUrl(pref.getString(profileUrlKey)!);
    }
    if (pref.containsKey(countryKey) && pref.containsKey(stateKey)) {
      address.saveAddress(
          pref.getString(countryKey)!, pref.getString(stateKey)!);
    }
  }
}
