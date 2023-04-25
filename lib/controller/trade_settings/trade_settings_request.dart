import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/cupertino.dart';

class TradeSetting {
  static changeCycle(BuildContext? context, String? positionID) async {
    var url = NetworkConstants.changeCycle;
    var response = await post(
        url: url,
        token: $user.accessToken,
        message: "changing trade cycles",
        context: context,
        body: {
          "position_id": positionID,
        });

    if (response['status_code'] == 200) {
      fetchPositions(
          mode: $dashboardDataBloc.getDashboardData.mode == "LIVE"
              ? "LIVE"
              : "DEMO");
      showToast(context!, response['data']['message']);
    } else {
      showToast(context!, response['data']['message'], isError: true);
    }
  }

  static closeTradePostions(BuildContext? context, String? positionID) async {
    var url = NetworkConstants.closePostions;
    var response = await post(
        message: "Closing trade Positions",
        url: url,
        token: $user.accessToken,
        context: context,
        body: {"position_id": positionID, "trader": "AUTO"});
    if (response['status_code'] == 200) {
      showToast(context!, response['data']['message']);
      fetchPositions(
          mode: $dashboardDataBloc.getDashboardData.mode == "LIVE"
              ? "LIVE"
              : "DEMO");
    } else {
      showToast(context!, response['data']['message'], isError: true);
    }
  }

  static killBot(BuildContext? context, String? positionID) async {
    var url = NetworkConstants.killBot;
    var response = await post(
        message: "Closing trade bots",
        url: url,
        token: $user.accessToken,
        context: context,
        body: {"position_id": positionID});

    if (response['status_code'] == 200) {
      fetchPositions(
          mode: $dashboardDataBloc.getDashboardData.mode == "LIVE"
              ? "LIVE"
              : "DEMO");
      showToast(context!, response['data']['message']);
    } else {
      showToast(context!, response['data']['message'], isError: true);
    }
  }

  static stopMargin(BuildContext? context, String? positionID) async {
    var url = NetworkConstants.stopMargin;
    var response = await post(
        message: "Stopping trade margins",
        url: url,
        token: $user.accessToken,
        context: context,
        body: {"position_id": positionID});

    if (response['status_code'] == 200) {
      showToast(context!, response['data']['message']);
    } else {
      showToast(context!, response['data']['message'], isError: true);
    }
  }
}
