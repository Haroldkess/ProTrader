import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/kDivider.dart';
import 'package:flutter/material.dart';

class BollingerTabTable extends StatelessWidget {
  const BollingerTabTable({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Coin",
                style: appTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.titleLarge!.color)),
            Text(
              "Bollinger Level",
              style: appTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: theme.textTheme.titleLarge!.color),
            ),
            Text("Signals",
                style: appTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.titleLarge!.color)),
          ],
        ),
        const KDivider(
          hP: 0,
          padding: 5,
        ),
        BollingerValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          signalText: "BUY/LONG",
          bollingerValue: "CLOSE TO LOWER BOLLINGER",
        ),
        BollingerValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          signalText: "BUY/LONG",
          bollingerValue: "CLOSE TO LOWER BOLLINGER",
        ),
        BollingerValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appRedColor,
          signalText: "SELL/SHORT",
          bollingerValue: "CLOSE TO LOWER BOLLINGER",
        ),
        BollingerValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          signalText: "BUY/LONG",
          bollingerValue: "CLOSE TO LOWER BOLLINGER",
        ),
        BollingerValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appRedColor,
          signalText: "SELL/SHORT",
          bollingerValue: "CLOSE TO LOWER BOLLINGER",
        ),
        BollingerValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          signalText: "BUY/LONG",
          bollingerValue: "CLOSE TO LOWER BOLLINGER",
        ),
        BollingerValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appRedColor,
          signalText: "SELL/SHORT",
          bollingerValue: "CLOSE TO LOWER BOLLINGER",
        ),
        BollingerValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          signalText: "BUY/LONG",
          bollingerValue: "CLOSE TO LOWER BOLLINGER",
        ),
        BollingerValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appRedColor,
          signalText: "SELL/SHORT",
          bollingerValue: "CLOSE TO LOWER BOLLINGER",
        ),
        BollingerValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          signalText: "BUY/LONG",
          bollingerValue: "CLOSE TO LOWER BOLLINGER",
        ),
      ],
    );
  }
}

class BollingerValues extends StatelessWidget {
  const BollingerValues(
      {super.key,
      this.coinName,
      this.valueBtnColor,
      this.bollingerValue,
      this.signalText});

  final Color? valueBtnColor;
  final String? coinName, bollingerValue, signalText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 13),
      color: valueBtnColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$coinName",
              style: appTextStyle.copyWith(
                  color: appWhite, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "$bollingerValue".toUpperCase(),
              style: appTextStyle.copyWith(
                  color: appWhite, fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            "$signalText",
            style: appTextStyle.copyWith(
                color: appWhite, fontSize: 13, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
