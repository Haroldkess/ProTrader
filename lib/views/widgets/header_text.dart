import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text(
      "$text",
      style: appTextStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: theme.textTheme.titleLarge!.color),
    );
  }
}
