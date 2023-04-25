import 'package:crypto_credit/models/robot/robot_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/header_text.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/settings_container.dart';
import 'package:flutter/material.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';

import '../../../controller/robot_settings/robot_settings_request.dart';
import '../../constants/textDecoration/text_decoration.dart';

class TradeSettings extends StatefulWidget {
  const TradeSettings({super.key});

  @override
  State<TradeSettings> createState() => _TradeSettingsState();
}

class _TradeSettingsState extends State<TradeSettings> {
  double _myCostValue = 0.0;
  double _leveragevalue = 0.0;
  double _totalCostValue = 0.0;
  String? trader, cycle, stoplossPercentage, takeProfit, marginCallLimit;
  String? tc;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
        body: PageWithBackButton(
            automaticallyImplyLeading: false,
            title: "Modify All Trade Settings",
            body: Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: StreamBuilder<RobotSettingsModel>(
                            stream: $robotSettings.robotSettings,
                            builder: (context, snapshot) {
                              while (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              }

                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amount Settings",
                                      style: appTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: theme
                                              .textTheme.titleLarge!.color),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    SettingsContainer(
                                      hP: 10,
                                      vP: 12,
                                      children: [
                                        Row(
                                          children: [
                                            RoundedTextField(
                                              number: true,
                                              label: "My Cost",
                                              initialValue: snapshot
                                                          .data!.myCost
                                                          .toString() ==
                                                      "null"
                                                  ? "0"
                                                  : snapshot.data!.myCost
                                                      .toString(),
                                              enabled: true,
                                              onchanged: (e) {
                                                setState(() {
                                                  _myCostValue =
                                                      double.parse(e!);
                                                  _totalCostValue =
                                                      _myCostValue *
                                                          _leveragevalue;
                                                });
                                              },
                                            ).expanded(),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            RoundedSelectField(
                                              hint: snapshot.data!.leverage
                                                          .toString() ==
                                                      "null"
                                                  ? "0"
                                                  : "${snapshot.data!.leverage}X",
                                              onchanged: (e) {
                                                var a = e!.replaceAll("x", "");
                                                setState(() {
                                                  _leveragevalue =
                                                      double.parse(a);
                                                  _totalCostValue =
                                                      _myCostValue *
                                                          _leveragevalue;
                                                });
                                              },
                                              items: const [
                                                "1x",
                                                "2x",
                                                "3x",
                                                "4x",
                                                "5x",
                                                "6x",
                                                "7x",
                                                "8x",
                                                "9x",
                                                "10x",
                                                "11x",
                                                "12x",
                                                "13x",
                                                "14x",
                                                "15x",
                                                "16x",
                                                "17x",
                                                "18x",
                                                "19x",
                                                "20x",
                                              ],
                                              label: "Leverage",
                                            ).expanded(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            RoundedTextField(
                                              readOnly: true,
                                              controller: TextEditingController(
                                                text: snapshot.hasData
                                                    ? _totalCostValue == 0.0
                                                        ? snapshot
                                                            .data!.totalCost
                                                            .toString()
                                                        : _totalCostValue
                                                            .toString()
                                                    : "0.0",
                                              ),
                                              onchanged: (e) {},
                                              label: "Total Cost",
                                            ).expanded(),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            RoundedSelectField(
                                              hint: snapshot.data!.trader ??
                                                  "Manual",
                                              items: const ["Auto", "Manual"],
                                              onchanged: (e) {
                                                trader = e;
                                              },
                                              label: "Trader",
                                            ).expanded(),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: HeaderText(
                                        text: "Amount of Cycles",
                                      ),
                                    ),
                                    SettingsContainer(
                                      hP: 10,
                                      vP: 12,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: RoundedTextField(
                                                number: true,
                                                initialValue: snapshot
                                                            .data!.noOfCycles
                                                            .toString() ==
                                                        "null"
                                                    ? "0"
                                                    : snapshot.data!.noOfCycles
                                                        .toString(),
                                                onchanged: ((e) {
                                                  setState(() {
                                                    cycle = e;
                                                  });
                                                }),
                                                label: "Cycles",
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 8),
                                              height: 46,
                                              width: double.infinity,

                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xff05d0a4)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                  child: Text("Cycles Config",
                                                      style:
                                                          appTextStyle.copyWith(
                                                              color: const Color(
                                                                  0xff05d0a4),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))),

                                              // borderR: 8,
                                              // text: "Cycles Config",
                                              // fontSize: 12,
                                              // textColor: Color(0xff05d0a4),
                                              // borderColor: Color(0xff  05d0a4),
                                            ).expanded()
                                          ],
                                        )
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: HeaderText(
                                        text: "Trade Settings",
                                      ),
                                    ),
                                    SettingsContainer(
                                      hP: 10,
                                      vP: 12,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: RoundedTextField(
                                                number: true,
                                                initialValue: snapshot
                                                            .data!.takeProfit
                                                            .toString() ==
                                                        "null"
                                                    ? "0"
                                                    : snapshot.data!.takeProfit
                                                        .toString(),
                                                onchanged: ((e) {
                                                  setState(() {
                                                    stoplossPercentage = e;
                                                  });
                                                }),
                                                label: "Stop Loss Percentage",
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Expanded(
                                              child: RoundedTextField(
                                                hint: "0",
                                                label: "Trailing Stop Loss",
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            RoundedTextField(
                                              number: true,
                                              initialValue: snapshot
                                                          .data!.takeProfit
                                                          .toString() ==
                                                      "null"
                                                  ? "0"
                                                  : snapshot.data!.takeProfit
                                                      .toString(),
                                              onchanged: ((e) {
                                                setState(() {
                                                  takeProfit = e;
                                                });
                                              }),
                                              label: "Take Profit",
                                            ).expanded(),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            RoundedTextField(
                                              number: true,
                                              initialValue: snapshot
                                                          .data!.marginCallLimit
                                                          .toString() ==
                                                      "null"
                                                  ? "0"
                                                  : snapshot
                                                      .data!.marginCallLimit
                                                      .toString(),
                                              onchanged: ((e) {
                                                setState(() {
                                                  marginCallLimit = e;
                                                });
                                              }),
                                              label: "Margin Call Limit",
                                            ).expanded(),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    StreamBuilder<bool>(
                                        stream: $robotSettings.canSave,
                                        builder: (context, s) {
                                          return customButton(
                                              text: "Save Config",
                                              function: () async {
                                                log(snapshot.data!.takeProfit);
                                                await saveRobotSettings(
                                                    context,
                                                    cycle ??
                                                        snapshot
                                                            .data!.noOfCycles
                                                            .toString(),
                                                    marginCallLimit ??
                                                        snapshot.data!
                                                            .marginCallLimit
                                                            .toString(),
                                                    trader ??
                                                        snapshot.data!.trader,
                                                    _myCostValue == 0.0
                                                        ? snapshot.data!.myCost
                                                        : _myCostValue,
                                                    _leveragevalue == 0.0
                                                        ? snapshot
                                                            .data!.leverage
                                                            .toString()
                                                        : _leveragevalue,
                                                    _totalCostValue == 0.0
                                                        ? snapshot.data!.myCost
                                                        : _totalCostValue,
                                                    takeProfit ??
                                                        snapshot
                                                            .data!.takeProfit);
                                              },
                                              enabled: true);
                                        }),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ]);
                            }))))));
  }
}
