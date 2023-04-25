import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/models/earning_model/earnings_model.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';

class EarningsTradeCard extends StatelessWidget {
  const EarningsTradeCard({Key? key, this.earningsPositions}) : super(key: key);

  final EarningsPositions? earningsPositions;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 19.5),
      margin: const EdgeInsets.only(bottom: 10, right: 16, left: 16),
      decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "RETURN",
                style: appTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff8F82A5)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text("${earningsPositions!.returni}%",
                  style: appTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.titleLarge!.color))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "DATE",
                style: appTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff8F82A5)),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 88,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xff8494A8)),
                child: Center(
                  child: Text(formatDate(earningsPositions!.date.toString()),
                      style: appTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: appWhite)),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "FUND",
                style: appTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff8F82A5)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text("${earningsPositions!.fund}",
                  style: appTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: theme.textTheme.titleLarge!.color))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "PROFIT",
                style: appTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff8F82A5)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text("${earningsPositions!.profit}",
                  style: appTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff1DCC70)))
            ],
          )
        ],
      ),
    );
  }
}
