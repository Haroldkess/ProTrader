// ignore_for_file: use_build_context_synchronously

import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/authentication/login/login_screens.dart';
import 'package:crypto_credit/views/authentication/reset_password.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/material.dart';

import '../../views/widgets/custom_alerts.dart';

sendResetLink(BuildContext? context) async {
  var url = NetworkConstants.sendResetLink;
  var response = await post(
      message: "Sending OTP",
      url: url,
      context: context,
      body: $fPassword.body);
  if (response['status_code'] == 200) {
    navigateToPage(context, const ResetPasswordScreen());
  } else {
    showToast(context!, response['data']['message'], isError: false);
  }
}

resetPassword(BuildContext? context) async {
  var url = NetworkConstants.resetPassword;
  var response = await post(
      url: url,
      context: context,
      body: $resetPassword.body,
      message: "Resetting Password");
  if (response['status_code'] == 200) {
    showToast(context!, response['data']['message'], isError: false);
    navigateToPage(context, const LoginScreen());
  } else {
    showToast(context!, response['data']['message'], isError: true);
  }
}
