import 'dart:convert';

import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:crypto_credit/views/widgets/trades/trade_details.dart';
import 'package:crypto_credit/views/widgets/trades/trade_icon_card.dart';
import 'package:crypto_credit/views/widgets/trades/trade_pair.dart';
import 'package:flutter/material.dart';
import '../../models/positions_model/single_positions_model.dart';
import '../constants/textDecoration/text_decoration.dart';
import 'custom_button.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PostionsCard extends StatelessWidget {
  PostionsCard({super.key, this.e});

  final SinglePostionsModel? e;
  WebSocketChannel? _channel;
  @override
  Widget build(BuildContext context) {
    _channel = establishConnection(e!.symbol);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: secondaryColor),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      formatCoinImage(e!.symbol),
                      errorBuilder: (context, error, stackTrace) {
                        return CircleAvatar(
                          radius: 30,
                        );
                      },
                      fit: BoxFit.contain,
                    )),
                const SizedBox(
                  width: 7,
                ),
                TradePair(firstPair: e!.symbol.toString()),
                const Spacer(),
                CustomMidButton(
                  borderR: 10,
                  fontSize: 12,
                  color: e!.mode == "DEMO" ? appRedColor : appGreen,
                  text: e!.mode,
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Cross ${e!.leverage}x",
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
                        color: e!.side == "SELL" ? appRedColor : appGreen,
                        text: e!.side)
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
                            final data = jsonDecode(snapshot.data as String);
                            final pnl = data["c"];
                            return Text(
                              "$pnl",
                              style: appTextStyle.copyWith(
                                  fontSize: 20,
                                  color: pnl.toString().contains("-")
                                      ? const Color(0xffFF396F)
                                      : appGreen,
                                  fontWeight: FontWeight.w500),
                            );
                          } else {
                            return Text(
                              "${e!.pnl}",
                              style: appTextStyle.copyWith(
                                  fontSize: 20,
                                  color: e!.pnl.toString().contains("-")
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
                      info: e!.size,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    TradeDetails(
                      title: "Entry Price",
                      info: e!.firstPrice,
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
                      e!.margin.toString(),
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
                      info: e!.nextMcost,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    TradeDetails(
                      title: "Mark Price",
                      info: e!.nextMprice,
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
                      "${e!.roe}%",
                      style: appTextStyle.copyWith(
                          fontSize: 20,
                          color: e!.roe.toString().contains("-")
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
                      "${e!.changes}%",
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
                      "${e!.liquidation}",
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
            Text(e!.createdAt.toString()),
          ],
        ),
      ),
    );
  }
}
