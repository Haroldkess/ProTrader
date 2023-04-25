import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/controller/user/user_request.dart';
import 'package:crypto_credit/models/robot/robot_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/material.dart';
import '../../views/widgets/custom_alerts.dart';

saveRobotSettings(BuildContext? context, String? noOfCycles, marginCallLimit,
    trader, myCost, leverage, totalCost, takeProfit) async {
  var url = NetworkConstants.saveRobotSettings;
  var body = {
    "id": $user.user.id,
    "robot_settings": {
      "margins": [],
      "cycles": [],
      "no_of_cycles": noOfCycles,
      "marginCallLimit": marginCallLimit,
      "trader": trader,
      "myCost": myCost,
      "leverage": leverage,
      "total_cost": totalCost,
      "takeProfit": takeProfit
    }
  };

  log(body);
  var response = await post(
      body: body,
      url: url,
      token: $user.accessToken,
      context: context,
      message: "Saving Config"); 
  log(response);
  if (response['status_code'] == 200) {
    showToast(context!, response['data']['message']);
    // ignore: use_build_context_synchronously
    getRobotSettings(context);
    // ignore: use_build_context_synchronously
    fetchUsers(context);
  } else {
    log(response);
    showToast(context!, response['data']['message'], isError: true);
  }
}

getRobotSettings(BuildContext? context) async {
  var url = NetworkConstants.getRobotSettings($user.user.id);
  log(url);
  var response =
      await get(url: url, token: $user.accessToken, context: context);
  RobotSettingsModel robotSettings;
  robotSettings =
      RobotSettingsModel.fromJson(response['data']['data']['robot_settings']);
  $robotSettings.addRobotSettings(robotSettings);
  log(response);
}
