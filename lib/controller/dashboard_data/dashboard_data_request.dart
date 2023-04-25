import 'dart:developer';

import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/models/dashboard_data/dashboard_data_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../views/landing_screens/home_page/bind_api/bind_apis.dart';
import '../../views/widgets/progress_indicator.dart';

fetchDashboardData(context, {bool? shouldPop, bool? isReload}) async {
  DashboardData dashboardData;
  var url = NetworkConstants.dashboardData;
  var response = await post(
      context: context,
      url: url,
      body: $dashboardDataBloc.body,
      token: $user.accessToken,
      message: "Fetching Data",
      isSWitch: isReload);
  if (response['status_code'] == 200) {
    dashboardData = DashboardData.fromJson(response['data']['data']);
    $dashboardDataBloc.addDashBoardData(dashboardData);
    shouldPop == true ? Navigator.pop(context) : null;
  } else {
    log(response.toString());
  }
}

fetchDashboardData2({String? mode}) async {
  DashboardData dashboardData;
  var url = NetworkConstants.dashboardData;
  var response = await post(
      url: url,
      body: {"mode": mode},
      token: $user.accessToken,
      message: "Fetching Data");

  //log(response);
  if (response['status_code'] == 200) {
    fetchPositions(mode: mode);
    dashboardData = DashboardData.fromJson(response['data']['data']);
    $dashboardDataBloc.addDashBoardData(dashboardData);
  }
}

changeMode(String? mode, BuildContext? c) async {
  var url = NetworkConstants.changeMode;
  FocusScopeNode currentFocus = FocusScope.of(c!);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
  progressIndicator(c, message: "Switching to $mode");
  var response = await post(url: url, body: {"mode": "$mode"}, isSWitch: true);

  if (response['status_code'] == 200) {
    print("this is what i want ${response.toString()}");
    var res = await post(
        url: NetworkConstants.dashboardData,
        body: {"mode": "$mode"},
        token: $user.accessToken,
        message: "Fetching Data",
        isSWitch: true);
    // Navigator.pop(c);

    if (res["status_code"] == 500) {
      // ignore: use_build_context_synchronously

      $dashboardDataBloc.addMode("DEMO");
      // ignore: use_build_context_synchronously
      await changeMode("DEMO", c);
      fetchPositions(mode: "DEMO");

      // ignore: use_build_context_synchronously
      fetchDashboardData(c, shouldPop: false, isReload: true);

      // ignore: use_build_context_synchronously
      showErrorDialog(
          c,
          "Live mode not found. ",
          "Account mode has been reverted to DEMO. Kindly bind your Live api keys",
          "Okay", () async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(c);
          Navigator.pop(c);

          Navigator.push(
              c,
              MaterialPageRoute(
                builder: (context) => const BindAPIScreen(
                  public: "",
                  secret: "",
                ),
              ));
        });
      });
    } else {
      DashboardData dashboardData = DashboardData.fromJson(res['data']['data']);
      $dashboardDataBloc.addDashBoardData(dashboardData);
       fetchPositions(mode: mode);
      // ignore: use_build_context_synchronously
      Navigator.pop(c);
      // ignore: use_build_context_synchronously
      Navigator.pop(c);
    }

    // log(res);
  } else if (response['status_code'] == 504 || response['status_code'] == 500) {
    // ignore: use_build_context_synchronously
    showToast(c, response['data'], isError: true);
  }
}
