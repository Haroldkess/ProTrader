import 'package:crypto_credit/controller/create_order/create_order_request.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/models/top_coins/top_coins_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/coin_details_header.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/loaders/progress_loader.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controller/positions/positions_requests.dart';
import '../../../models/positions_model/positions_model.dart';
import '../../../models/robot/robot_model.dart';
import '../../widgets/custom_fields.dart';
import '../../widgets/header_text.dart';
import '../../widgets/settings_container.dart';

class CoinDetailsWithSignal extends StatefulWidget {
  const CoinDetailsWithSignal({Key? key, this.e}) : super(key: key);

  final TopCoinsModel? e;

  @override
  State<CoinDetailsWithSignal> createState() => _CoinDetailsWithSignalState();
}

class _CoinDetailsWithSignalState extends State<CoinDetailsWithSignal> {
  double _myCostValue = 0.0;
  double _leveragevalue = 0.0;
  double _totalCostValue = 0.0;
  String? trader, cycle, stoplossPercentage, takeProfit, marginCallLimit;
  String? tc;
  bool buyExist = false;
  bool sellExist = false;
  bool bothExist = false;

  @override
  void initState() {
    super.initState();
    fetchPositions(
        mode: $dashboardDataBloc.getDashboardData.mode == "LIVE"
            ? "LIVE"
            : "DEMO");
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Icon(Icons.share),
          SizedBox(
            width: 15,
          ),
        ],
        backgroundColor: primaryColor,
        title: Text(
          "${widget.e!.symbol}",
          style: appTextStyle.copyWith(
              color: appWhite, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          CoinDetailsHeader(
            e: widget.e!,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StreamBuilder<RobotSettingsModel>(
                stream: $robotSettings.robotSettings,
                builder: (context, snapshot) {
                  while (!snapshot.hasData) {
                    return const Loader();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Amount Settings",
                        style: appTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: theme.textTheme.titleLarge!.color),
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
                                initialValue:
                                    snapshot.data!.myCost.toString() == "null"
                                        ? "0"
                                        : snapshot.data!.myCost.toString(),
                                enabled: true,
                                onchanged: (e) {
                                  setState(() {
                                    _myCostValue = double.parse(e!);
                                    _totalCostValue =
                                        _myCostValue * _leveragevalue;
                                  });
                                },
                              ).expanded(),
                              const SizedBox(
                                width: 12,
                              ),
                              RoundedSelectField(
                                hint: snapshot.data!.leverage == "null"
                                    ? "0"
                                    : "${snapshot.data!.leverage}X",
                                onchanged: (e) {
                                  var a = e!.replaceAll("x", "");
                                  setState(() {
                                    _leveragevalue = double.parse(a);
                                    _totalCostValue =
                                        _myCostValue * _leveragevalue;
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
                                          ? snapshot.data!.totalCost.toString()
                                          : _totalCostValue.toString()
                                      : "0.0",
                                ),
                                onchanged: (e) {},
                                label: "Total Cost",
                              ).expanded(),
                              const SizedBox(
                                width: 12,
                              ),
                              RoundedSelectField(
                                hint: snapshot.data!.trader ?? "Manual",
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
                        padding: EdgeInsets.symmetric(vertical: 12),
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
                                  initialValue: snapshot.data!.noOfCycles
                                              .toString() ==
                                          "null"
                                      ? "0"
                                      : snapshot.data!.noOfCycles.toString(),
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
                                margin: const EdgeInsets.only(top: 8),
                                height: 46,
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff05d0a4)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                    child: Text("Cycles Config",
                                        style: appTextStyle.copyWith(
                                            color: const Color(0xff05d0a4),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500))),

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
                        padding: EdgeInsets.symmetric(vertical: 12),
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
                                  initialValue: snapshot.data!.takeProfit
                                              .toString() ==
                                          "null"
                                      ? "0"
                                      : snapshot.data!.takeProfit.toString(),
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
                                initialValue:
                                    snapshot.data!.takeProfit.toString() ==
                                            "null"
                                        ? "0"
                                        : snapshot.data!.takeProfit.toString(),
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
                                initialValue: snapshot.data!.marginCallLimit
                                            .toString() ==
                                        "null"
                                    ? "0"
                                    : snapshot.data!.marginCallLimit.toString(),
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

                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 5),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: StreamBuilder<List<TradePositions>>(
                                    stream: $positions.tradePosition,
                                    builder: (context, trade) {
                                      bool exist = false;
                                      List<TradePositions> isOpen;
                                      List<String> position = [];

                                      while (!trade.hasData) {
                                        return const SizedBox();
                                      }

                                      if (trade.connectionState ==
                                          ConnectionState.waiting) {
                                        return const SizedBox();
                                      }

                                      if (trade.data != null) {
                                        isOpen = trade.data!
                                            .where((element) =>
                                                element.symbol ==
                                                widget.e!.symbol)
                                            .toList();

                                        if (isOpen.isEmpty) {
                                        } else {
                                          Future.forEach(isOpen,
                                              (element) async {
                                            if (element.side == "BUY" &&
                                                element.status == "OPEN") {
                                              exist = true;
                                            } else {}
                                          });
                                        }
                                      }

                                      return FutureBuilder(
                                          future: Future.delayed(
                                              Duration(seconds: 2)),
                                          builder: (context, _) {
                                            return customButton(
                                                function: () async {
                                                  if (exist) {
                                                    showToast(context,
                                                        "A BUY position is open. Consider closing it before performing this action",
                                                        isError: true);
                                                  } else {
                                                    await createOrderRequest(
                                                      context,
                                                      widget.e!.symbol,
                                                      "MARKET",
                                                      "BUY",
                                                      _totalCostValue == 0.0
                                                          ? snapshot
                                                              .data!.totalCost
                                                              .toString()
                                                          : _totalCostValue,
                                                      _leveragevalue == 0.0
                                                          ? snapshot
                                                              .data!.leverage
                                                              .toString()
                                                          : _leveragevalue,
                                                      "FIRST",
                                                      _myCostValue == 0.0
                                                          ? snapshot
                                                              .data!.myCost
                                                          : _myCostValue,
                                                      cycle ??
                                                          snapshot
                                                              .data!.noOfCycles
                                                              .toString(),
                                                      takeProfit ??
                                                          snapshot
                                                              .data!.takeProfit,
                                                      _totalCostValue == 0.0
                                                          ? snapshot
                                                              .data!.myCost
                                                          : _totalCostValue,
                                                      trader ??
                                                          snapshot.data!.trader,
                                                    );
                                                  }
                                                },
                                                backgroundColor: exist
                                                    ? const Color(0xff1DCC70)
                                                        .withOpacity(.4)
                                                    : const Color(0xff1DCC70),
                                                text: "BUY");
                                          });
                                    }),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  child: StreamBuilder<List<TradePositions>>(
                                      stream: $positions.tradePosition,
                                      builder: (context, trade) {
                                        bool isExist = false;
                                        List<TradePositions> isOpen;
                                        while (!trade.hasData) {
                                          return const SizedBox();
                                        }

                                        if (trade.connectionState ==
                                            ConnectionState.waiting) {
                                          return const SizedBox();
                                        }

                                        if (trade.hasData &&
                                            trade.data != null) {
                                          isOpen = trade.data!
                                              .where((element) =>
                                                  element.symbol ==
                                                  widget.e!.symbol)
                                              .toList();

                                          if (isOpen.isEmpty) {
                                          } else {
                                            Future.forEach(isOpen,
                                                (element) async {
                                              if (element.side == "SELL" &&
                                                  element.status == "OPEN") {
                                                isExist = true;
                                              } else {}
                                            });
                                          }
                                        }

                                        return FutureBuilder(
                                            future: Future.delayed(
                                                Duration(seconds: 1)),
                                            builder: (context, _) {
                                              return customButton(
                                                  function: () async {
                                                    // log(trader);
                                                    if (isExist) {
                                                      showToast(context,
                                                          "A SELL position is open. Consider closing it before performing this action",
                                                          isError: true);
                                                    } else {
                                                      await createOrderRequest(
                                                        context,
                                                        widget.e!.symbol,
                                                        "MARKET",
                                                        "SELL",
                                                        _totalCostValue == 0.0
                                                            ? snapshot
                                                                .data!.totalCost
                                                                .toString()
                                                            : _totalCostValue,
                                                        _leveragevalue == 0.0
                                                            ? snapshot
                                                                .data!.leverage
                                                                .toString()
                                                            : _leveragevalue,
                                                        "FIRST",
                                                        _myCostValue == 0.0
                                                            ? snapshot
                                                                .data!.myCost
                                                            : _myCostValue,
                                                        cycle ??
                                                            snapshot.data!
                                                                .noOfCycles
                                                                .toString(),
                                                        takeProfit ??
                                                            snapshot.data!
                                                                .takeProfit,
                                                        _totalCostValue == 0.0
                                                            ? snapshot
                                                                .data!.myCost
                                                            : _totalCostValue,
                                                        trader ??
                                                            snapshot
                                                                .data!.trader,
                                                      );
                                                    }
                                                  },
                                                  backgroundColor: isExist
                                                      ? const Color(0xffFF396F)
                                                          .withOpacity(.4)
                                                      : const Color(0xffFF396F),
                                                  text: "SELL");
                                            });
                                      })),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  child: StreamBuilder<List<TradePositions>>(
                                      stream: $positions.tradePosition,
                                      builder: (context, trade) {
                                        bool exist = false;
                                        final List<TradePositions> isOpen;
                                        while (!trade.hasData) {
                                          return const SizedBox();
                                        }

                                        if (trade.connectionState ==
                                            ConnectionState.waiting) {
                                          return const SizedBox();
                                        }
                                        if (trade.data != null) {
                                          isOpen = trade.data!
                                              .where((element) =>
                                                  element.symbol ==
                                                      widget.e!.symbol &&
                                                  element.status == "OPEN")
                                              .toList();

                                          if (isOpen.isEmpty) {
                                          } else {
                                            exist = true;
                                            // Future.forEach(isOpen,
                                            //     (element) async {
                                            //   if (element.side == "SELL" &&
                                            //       element.status == "OPEN") {
                                            //     exist = true;
                                            //   } else if (element.side ==
                                            //           "BUY" &&
                                            //       element.status == "OPEN") {
                                            //     exist = true;
                                            //   }
                                            // });
                                          }
                                        }

                                        return FutureBuilder(
                                            future: Future.delayed(
                                                Duration(seconds: 1)),
                                            builder: (context, _) {
                                              return customButton(
                                                  function: () async {
                                                    if (exist) {
                                                      showToast(context,
                                                          "A SELL/BUY position is open. Consider closing it before performing this action",
                                                          isError: true);
                                                    } else {
                                                      await createOrderRequest(
                                                        context,
                                                        widget.e!.symbol,
                                                        "MARKET",
                                                        "BOTH",
                                                        _totalCostValue == 0.0
                                                            ? snapshot
                                                                .data!.totalCost
                                                                .toString()
                                                            : _totalCostValue,
                                                        _leveragevalue == 0.0
                                                            ? snapshot
                                                                .data!.leverage
                                                                .toString()
                                                            : _leveragevalue,
                                                        "FIRST",
                                                        _myCostValue == 0.0
                                                            ? snapshot
                                                                .data!.myCost
                                                            : _myCostValue,
                                                        cycle ??
                                                            snapshot.data!
                                                                .noOfCycles
                                                                .toString(),
                                                        takeProfit ??
                                                            snapshot.data!
                                                                .takeProfit,
                                                        _totalCostValue == 0.0
                                                            ? snapshot
                                                                .data!.myCost
                                                            : _totalCostValue,
                                                        trader ??
                                                            snapshot
                                                                .data!.trader,
                                                      );
                                                    }
                                                  },
                                                  backgroundColor: exist
                                                      ? const Color(0xff1DCC79)
                                                          .withOpacity(.4)
                                                      : const Color(0xff1DCC79),
                                                  text: "BOTH");
                                            });
                                      })),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      // StreamBuilder<SinglePostionsModel>(
                      //     stream: $positions.singleTradePosition,
                      //     builder: (context, snapshot) {
                      //       while (!snapshot.hasData) {
                      //         return const CupertinoActivityIndicator();
                      //       }
                      //       return TradeSignalsCard(
                      //         singlePostionsModel: snapshot.data,
                      //       );
                      //     }),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      //   child: Text(
                      //     "Signal Settings",
                      //     style: appTextStyle.copyWith(
                      //         fontSize: 15, fontWeight: FontWeight.w500, color: appWhite),
                      //   ),
                      // ),
                      // const TradeSignalSettingsCard(),

                      const SizedBox(
                        height: kToolbarHeight,
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
