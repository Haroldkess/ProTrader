import 'package:crypto_credit/controller/create_order/create_order_bloc.dart';
import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/controller/user/user_request.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/cupertino.dart';

createOrderRequest(
  BuildContext? context,
  String? symbol,
  entryType,
  side,
  cost,
  leverage,
  marginType,
  myCost,
  noOfCycle,
  takeProfit,
  totalCost,
  trader,
) async {
  var url = NetworkConstants.createOrders;
  Map<String, dynamic> body;
  body = {
    "symbol": symbol,
    "entry_type": "MARKET",
    "side": side,
    "cost": cost,
    "leverage": leverage,
    "margin_type": "FIRST",
    "mode": $dashboardDataBloc.getDashboardData.mode,
    "marginCallLimit": 1,
    "margins": [],
    "myCost": myCost,
    "no_of_cycles": noOfCycle,
    "takeProfit": takeProfit,
    "total_cost": totalCost,
    "trader": trader
  };
  var response = await post(
      message: "Creating $side Order",
      url: side != "BOTH" ? url : "${url}2",
      token: $user.accessToken,
      context: context,
      body: body,
      isTrade: true);

  log(body);
  if (response['status_code'] == 200) {
    // ignore: use_build_context_synchronously
    fetchUsers(context).then((e) {
      showSuccessDialog(
        context!,
        "Success",
        response['data']['message'],
        "Okay",
      );
    });
  }  else {
    Navigator.pop(context!);
    log(response);
    // ignore: use_build_context_synchronously
    showErrorDialog(
        context, "Somehthing Went Wrong", response['data']['message'], "Retry",
        () {
      Navigator.pop(context);
    });
  }
}
