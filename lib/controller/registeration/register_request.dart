// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/authentication/login/login_screens.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/material.dart';

registerUser(BuildContext? context) async {
  var url = NetworkConstants.register;
  var response = await post(
      url: url,
      context: context,
      body: $registerBloc.body,
      message: "Registering User");

  try {
    if (response['status_code'] == 200) {
      $registerBloc.dispose();
      showToast(context!, response['data']['message']);
      navigateToPage(context, const LoginScreen());
    } else if (response['status_code'] == 408) {
      //  $registerBloc.dispose();

      showToast(context!, "Timeout Exception, Try Again!!!", isError: true);
    } else if (response['status_code'] == 504) {
      // $registerBloc.dispose();
   
      showToast(context!, "Internet Connection Error, Try again!!!",
          isError: true);
    } else if (response['status_code'] == 422) {
      // $registerBloc.dispose();
      try {
        showToast(context!, response['data']['data']['errors']['email'][0],
            isError: true);
      } catch (_) {}
      try {
        showToast(
            context!, response['data']['data']['errors']['referrered_by_id'][0],
            isError: true);
      } catch (_) {}
      try {
        showToast(context, response['data']['data']['errors']['name'][0],
            isError: true);
      } catch (_){}
    } else {
      //   $registerBloc.dispose();
      showToast(context!, response['data']['message'], isError: true);
    }
  } catch (e) {
    showToast(context!, e.toString(), isError: true);
  }
}
