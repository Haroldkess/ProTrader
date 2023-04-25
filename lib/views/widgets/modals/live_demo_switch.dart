import 'package:crypto_credit/controller/dashboard_data/dashboard_data_request.dart';
import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/models/dashboard_data/dashboard_data_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/material.dart';

showLiveModal(BuildContext? c) {
  var theme = Theme.of(c!);
  // String? mode;
  showModalBottomSheet(
      backgroundColor: theme.colorScheme.secondary,
      context: c,
      builder: (context) => Container(
            height: 250,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
            color: theme.colorScheme.secondary,
            child: StreamBuilder<DashboardData>(
                stream: $dashboardDataBloc.dashBoardData,
                builder: (context, snapshot) {
                  while (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      const SizedBox(
                        height: 11,
                      ),
                      Text(
                        "Switch Trade Mode",
                        textAlign: TextAlign.center,
                        style: appTextStyle.copyWith(
                            fontSize: 15,
                            color: theme.textTheme.titleLarge!.color,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: theme.textTheme.titleLarge!.color,
                        thickness: 0.02,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text("LIVE Trader"),
                          const Spacer(),
                          CustomMidButton(
                            borderR: 5,
                            color: snapshot.data!.mode == "LIVE"
                                ? const Color(0xff8ee6b8)
                                : const Color(0xff1DCC70),
                            text: snapshot.data!.mode == "LIVE"
                                ? "CURRENT"
                                : "SWITCH",
                            onTap: () async {
                              $dashboardDataBloc.addMode("LIVE");
                              changeMode("LIVE", context);
                              // ignore: use_build_context_synchronously
                              fetchDashboardData(c);
                              fetchPositions(mode: "LIVE");

                              // var url = NetworkConstants.dashboardData;
                              // log(url);
                              // var e = await post(
                              //     url: url,
                              //     token: $user.accessToken,
                              //     context: c,
                              //     body: {"mode": "LIVE"});
                              // log(e);
                            },
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const Text("DEMO Trader"),
                          const Spacer(),
                          CustomMidButton(
                            borderR: 5,
                            color: snapshot.data!.mode == "DEMO"
                                ? const Color(0xff8ee6b8)
                                : const Color(0xff1DCC70),
                            text: snapshot.data!.mode == "DEMO"
                                ? "CURRENT"
                                : "SWITCH",
                            onTap: snapshot.data!.mode == "DEMO"
                                ? () {}
                                : () async {
                                    $dashboardDataBloc.addMode("DEMO");
                                    changeMode("DEMO", context);
                                    fetchPositions(mode: "DEMO");
                                    await fetchDashboardData(c);
                                  },
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 24,
                      ),
                      // customButton(
                      //     function: () async {
                      //       fetchPositions(mode: mode);
                      //       await fetchDashboardData(context);
                      //     },
                      //     backgroundColor: const Color(0xff1DCC70),
                      //     text: "Switch trade mode")
                    ],
                  );
                }),
          ));
}
