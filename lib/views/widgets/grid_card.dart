import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  const GridCard({Key? key, this.title, this.textColor, this.amount})
      : super(key: key);

  final String? title, amount;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        height: 92.5,
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$title",
              style: appTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff8F82A5)),
            ),
            const SizedBox(
              height: 6.2,
            ),
            Text(
              "$amount",
              style: appTextStyle.copyWith(
                  color: textColor ?? theme.textTheme.titleLarge!.color,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}
