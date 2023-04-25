// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:crypto_credit/controller/keys/pref_keys.dart';
import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/models/user_model/user_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/landing_screens/landing_screen.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:flutter/material.dart';

fetchUsers(
  BuildContext? context,
) async {
  var url = NetworkConstants.user;
  var response =
      await get(url: url, context: context, token: $user.accessToken);
  if (response['status_code'] == 200) {
    log(response.toString());
    User user;
    user = User.fromJson(response['data']['data']);
    await saveUserInfo(
      user.id!,
      user.username,
      user.avatar,
      user.name,
      user.phone,
      user.state,
      user.country,
    );

    $user.addUsers(user);
    Navigator.pushReplacement(context!, MaterialPageRoute(builder: (context) {
      return const Dashboard();
    }));
    // }
  } else {
    showToast(context, response['data']['message'], isError: true);
  }
}
