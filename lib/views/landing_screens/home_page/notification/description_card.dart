import 'package:crypto_credit/controller/notifications/read_all_notification/notification_desc_model.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/trades/trade_details.dart';
import 'package:crypto_credit/views/widgets/trades/trade_pair.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../icons/app_icons_widget.dart';

class DescriptionTradeCard extends StatelessWidget {
  const DescriptionTradeCard(
      {Key? key, required this.tradePositions, required this.isClosedScreen})
      : super(key: key);

  final Datum tradePositions;
  final bool isClosedScreen;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Visibility(
      visible: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: theme.colorScheme.secondary),
          child: Column(
            children: [
              TradeHeader(
                tradeData: tradePositions,
              ),
              const SizedBox(
                height: 16,
              ),
              TradeTopDetails(
                tradeData: tradePositions,
              ),
              const SizedBox(
                height: 17,
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tradePositions.updatedAt.toString(),
                    style: appTextStyle.copyWith(
                        fontSize: 11,
                        color: lightTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TradeTabs extends StatelessWidget {
  const TradeTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Position: 9",
          style:
              appTextStyle.copyWith(fontSize: 8, fontWeight: FontWeight.w500),
        ),
        Text(
          "Copy Traders",
          style:
              appTextStyle.copyWith(fontSize: 8, fontWeight: FontWeight.w500),
        ),
        Text(
          "Open Trades : 8",
          style:
              appTextStyle.copyWith(fontSize: 8, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

class TradeHeader extends StatelessWidget {
  const TradeHeader({Key? key, this.tradeData}) : super(key: key);

  final Datum? tradeData;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(80)),
              child: SizedBox(
                  height: 48,
                  width: 48,
                  child: CircleAvatar(
                    backgroundColor: theme.colorScheme.secondary,
                    child: CachedNetworkImage(
                      
                      placeholderFadeInDuration: const Duration(seconds: 1),
                      placeholder: (context, url) {
                        return const AppIcons(
                          icons: "splash",
                          size: 30,
                        );
                      },
                      
                      imageUrl: formatCoinImage(
                        tradeData!.symbol.toString(),
                      ),
                      errorWidget: (context, error, stackTrace) {
                        return const AppIcons(
                          icons: "splash",
                          size: 48,
                        );
                      },
                      fit: BoxFit.contain,
                    ),
                  )),
            ),
            const SizedBox(
              width: 7,
            ),
            TradePair(firstPair: tradeData!.symbol.toString()),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(7),
                    color: tradeData!.mode == "DEMO"
                        ? theme.buttonColor
                        : appGreen),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: Text(
                    tradeData!.mode!,
                    style: appTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: appWhite),
                  ),
                ),
              ),
            ),
          ],
        ),
        ClosedTradeBuySellCard(
          tradePositions: tradeData,
        )
      ],
    );
  }
}

class TradeTopDetails extends StatelessWidget {
  const TradeTopDetails({Key? key, this.tradeData}) : super(key: key);

  final Datum? tradeData;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
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
            Text(
              "${tradeData!.pnl}",
              style: appTextStyle.copyWith(
                  fontSize: 20,
                  color: tradeData!.pnl.toString().contains("-")
                      ? const Color(0xffFF396F)
                      : appGreen,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 9,
            ),
            TradeDetails(
              title: "SIZE",
              info: "${tradeData!.size}",
            ),
            const SizedBox(
              height: 9,
            ),
            TradeDetails(
              title: "Entry Price",
              info: "${tradeData!.firstPrice}",
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
                  color: theme.textTheme.titleLarge!.color,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 9,
            ),
            TradeDetails(
              title: "Next Margin",
              info: "${tradeData!.nextMcost}",
            ),
            const SizedBox(
              height: 9,
            ),
            TradeDetails(
              title: "Mark Price",
              info: "${tradeData!.nextMprice}",
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
                  color: theme.textTheme.titleLarge!.color,
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
                  color: theme.textTheme.titleLarge!.color,
                  fontWeight: FontWeight.w500),
            )
          ],
        )
      ],
    );
  }
}

class ClosedTradeBuySellCard extends StatelessWidget {
  const ClosedTradeBuySellCard({
    Key? key,
    this.tradePositions,
  }) : super(key: key);
  final Datum? tradePositions;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Isolated ${tradePositions!.leverage}x",
          style: appTextStyle.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: const Color(0xff8F82A5)),
        ),
        const SizedBox(
          height: 9,
        ),
        CustomMidButton(
            onTap: () {},
            borderR: 10,
            fontSize: 12,
            color:
                tradePositions!.side == "SELL" ? theme.buttonColor : appGreen,
            text: tradePositions!.side)
      ],
    );
  }
}
