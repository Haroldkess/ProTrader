// ignore_for_file: use_build_context_synchronously

import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/controller/user/user_request.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/cupertino.dart';

adjustMarginRequest(BuildContext? c, String? positionID, size) async {
  var url = NetworkConstants.addMargin;
  var response = await post(
      url: url,
      token: $user.accessToken,
      context: c,
      body: {"position_id": positionID, "size": size, "trader": "AUTO"});
  if (response['status_code'] == 200) {
    fetchUsers(c);
    showSuccessDialog(
      c!,
      "Success",
      response['data']['message'],
      "Okay",
    );
  } else {
    showToast(c, response['data']['message'], isError: true);
  }
}
