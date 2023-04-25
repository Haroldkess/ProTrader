import 'package:crypto_credit/controller/dashboard_data/dashboard_data_request.dart';
import 'package:crypto_credit/controller/field_validations/validations.dart';
import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/dashboard_data/dashboard_data_model.dart';

class UpdateDemoBLoc with FieldValidation {
  final _newBalance = BehaviorSubject<String>();

  Stream<String> get balance => _newBalance.stream.transform(validInput);
  addNewBalance(String? e) => _newBalance.sink.add(e!);

  get body => {"demo_balance": _newBalance.value};

  dispose() {
    _newBalance.drain([]);
    _newBalance.add("");
    _newBalance.done;
  }
}

updateNewBalance(BuildContext? context) async {
  var url = NetworkConstants.updateBalance;


  var response = await post(
      url: url,
      body: $updateDemo.body,
      token: $user.accessToken,
      context: context);
  log($updateDemo.body);

  if (response['status_code'] == 200) {
    var res = await post(
        context: context,
        url: NetworkConstants.dashboardData,
        body: {"mode": "DEMO"},
        token: $user.accessToken,
        message: "Fetching Data");

    DashboardData dashboardData = DashboardData.fromJson(res['data']['data']);
    await $dashboardDataBloc.addDashBoardData(dashboardData);
    Navigator.pop(context!);
  } else {
    // ignore: use_build_context_synchronously
    showToast(context, response['data']['message'], isError: true);
  }
}
