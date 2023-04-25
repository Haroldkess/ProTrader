import 'dart:convert';

import 'package:crypto_credit/models/positions_model/positions_model.dart';
import 'package:crypto_credit/models/positions_model/single_positions_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:crypto_credit/views/widgets/trade_details_header.dart';
import 'package:crypto_credit/views/widgets/trade_signals_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../controller/positions/positions_requests.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/trades/trade_details.dart';

class TradeDetailsWithSignal extends StatelessWidget {
  TradeDetailsWithSignal({Key? key, this.tradeData}) : super(key: key);

  final TradePositions? tradeData;
  WebSocketChannel? _channel;
  @override
  Widget build(BuildContext context) {
    _channel = establishConnection(tradeData!.symbol);
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
          "${tradeData!.symbol}",
          style: appTextStyle.copyWith(
              color: appWhite, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          TradeDetailsHeader(
            tradeData: tradeData!,
          ),
          // const BuySellCard(),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: theme.colorScheme.secondary),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Cross ${tradeData!.leverage}x",
                            style: appTextStyle.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff8F82A5)),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          CustomMidButton(
                              borderR: 10,
                              fontSize: 12,
                              color: tradeData!.side == "SELL"
                                  ? appRedColor
                                  : appGreen,
                              text: tradeData!.side)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Unrealized PNL",
                            style: appTextStyle.copyWith(
                                fontSize: 11,
                                color: lightTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 0.4,
                          ),
                          StreamBuilder(
                              stream: _channel!.stream,
                              builder: (context, snapshot) {
                                log(snapshot.data);
                                if (snapshot.hasData) {
                                  final data =
                                      jsonDecode(snapshot.data as String);
                                  final pnl = data["c"];
                                  return Text(
                                    "$pnl",
                                    style: appTextStyle.copyWith(
                                        fontSize: 20,
                                        color: const Color(0xffFF396F),
                                        fontWeight: FontWeight.w500),
                                  );
                                } else {
                                  return Text(
                                    "${tradeData!.pnl}",
                                    style: appTextStyle.copyWith(
                                        fontSize: 20,
                                        color: tradeData!.pnl
                                                .toString()
                                                .contains("-")
                                            ? const Color(0xffFF396F)
                                            : appGreen,
                                        fontWeight: FontWeight.w500),
                                  );
                                }
                              }),
                          const SizedBox(
                            height: 9,
                          ),
                          TradeDetails(
                            title: "SIZE",
                            info: tradeData!.size,
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          TradeDetails(
                            title: "Entry Price",
                            info: tradeData!.firstPrice,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Margin (2/5)",
                            style: appTextStyle.copyWith(
                                fontSize: 11,
                                color: lightTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            tradeData!.margin.toString(),
                            style: appTextStyle.copyWith(
                                fontSize: 11,
                                color: appWhite,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          TradeDetails(
                            title: "Next Margin",
                            info: tradeData!.nextMcost,
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          TradeDetails(
                            title: "Mark Price",
                            info: tradeData!.nextMprice,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "ROE",
                            style: appTextStyle.copyWith(
                                fontSize: 11,
                                color: lightTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 0.4,
                          ),
                          Text(
                            "${tradeData!.roe}%",
                            style: appTextStyle.copyWith(
                                fontSize: 20,
                                color: tradeData!.roe.toString().contains("-")
                                    ? const Color(0xffFF396F)
                                    : appGreen,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Text(
                            "% Change",
                            style: appTextStyle.copyWith(
                                color: lightTextColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${tradeData!.changes}%",
                            style: appTextStyle.copyWith(
                                fontSize: 11,
                                color: appWhite,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Text(
                            "Liq. Price(0/0)",
                            style: appTextStyle.copyWith(
                                color: lightTextColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${tradeData!.liquidation}",
                            style: appTextStyle.copyWith(
                                fontSize: 11,
                                color: appWhite,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      color: appWhite.withOpacity(.2),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // const BuySellCard(),
          const SizedBox(
            height: 16,
          ),
          StreamBuilder<SinglePostionsModel>(
              stream: $positions.singleTradePosition,
              builder: (context, snapshot) {
                while (!snapshot.hasData) {
                  return const CupertinoActivityIndicator();
                }
                return TradeSignalsCard(
                  singlePostionsModel: snapshot.data,
                );
              }),
          const SizedBox(
            height: 10,
          ),
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
      ),
    );
  }
}
