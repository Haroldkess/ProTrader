import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/kDivider.dart';
import 'package:flutter/material.dart';

class RSITabTable extends StatelessWidget {
  const RSITabTable({super.key});

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
              "RSI Value",
              style: appTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: theme.textTheme.titleLarge!.color),
            ),
            Text("Action",
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
        RSIValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          coinValue: 70.toString(),
          valueBtnText: "BUY/LONG",
        ),
        const KDivider(
          hP: 0,
          padding: 5,
        ),
        RSIValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          coinValue: 70.toString(),
          valueBtnText: "BUY/LONG",
        ),
        const KDivider(
          hP: 0,
          padding: 5,
        ),
        RSIValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appRedColor,
          coinValue: 70.toString(),
          valueBtnText: "SELL/SHORT",
        ),
        const KDivider(
          hP: 0,
          padding: 5,
        ),
        RSIValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          coinValue: 70.toString(),
          valueBtnText: "BUY/LONG",
        ),
        const KDivider(
          hP: 0,
          padding: 5,
        ),
        RSIValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          coinValue: 70.toString(),
          valueBtnText: "BUY/LONG",
        ),
        const KDivider(
          hP: 0,
          padding: 5,
        ),
        RSIValues(
          coinName: "AAVEUSDT",
          valueBtnColor: appGreen,
          coinValue: 70.toString(),
          valueBtnText: "SELL/SHORT",
        ),
      ],
    );
  }
}

class RSIValues extends StatelessWidget {
  const RSIValues(
      {super.key,
      this.coinName,
      this.coinValue,
      this.valueBtnText,
      this.valueBtnColor});

  final Color? valueBtnColor;
  final String? coinName, coinValue, valueBtnText;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$coinName",
          style: appTextStyle.copyWith(
              color: lightTextColor, fontSize: 13, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Text(
          "$coinValue",
          style: appTextStyle.copyWith(
              color: lightTextColor, fontSize: 13, fontWeight: FontWeight.w400),
        ),
        Spacer(),
        CustomMidButton(
          borderR: 10,
          fontSize: 12,
          text: "$valueBtnText".toUpperCase(),
          color: valueBtnColor,
        )
      ],
    );
  }
}
