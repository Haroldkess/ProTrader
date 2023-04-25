// ignore_for_file: use_build_context_synchronously
import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/controller/user/user_request.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/material.dart';
import '../../local_db/login_details.dart';
import '../../views/widgets/custom_alerts.dart';
import '../dashboard_data/dashboard_data_request.dart';
import '../keys/pref_keys.dart';

loginUser(BuildContext? context) async {
  var url = NetworkConstants.login;
  var response = await post(
      body: $loginBloc.body, url: url, context: context, message: "Signin In");
  log(response);
  try {
    if (response['status_code'] == 200) {
      var token = response['data']['accessToken'];
      var referalId = response["data"]["userData"]["referrer_id"];
      await saveToken(context, token, referalId);
      $user.addAccessToken("$token");
      setUserDetails($loginBloc.body['email'], $loginBloc.body['password']);
      fetchDashboardData2(mode: "DEMO");
      fetchUsers(context!);
    } else if (response['status_code'] == 500) {
      showToast(context, "binanceusdm requires apiKey credential",
          isError: true);
    } else if (response['data']
        .toString()
        .contains("Failed host lookup: 'api.bizzatrader.com'")) {
      showToast(context, "Check Internet Connectivity", isError: true);
    } else {
      showToast(context!, response['data']['message'], isError: true);
    }
  } catch (e) {
    showToast(
        context, response['data'] ?? "Something went wrong please try again",
        isError: true);
  }
}
