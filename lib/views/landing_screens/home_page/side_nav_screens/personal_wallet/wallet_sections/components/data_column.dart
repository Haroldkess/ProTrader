import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';

Color dividerColor = Colors.grey.shade500;
DataColumn dataColumn(BuildContext context, var width, String name) {
   var theme = Theme.of(context);
  return DataColumn(
    label: Text(
      name,
       style: appTextStyle.copyWith(
                color: theme.textTheme.titleLarge!.color,
                fontSize: 16,
                fontWeight: FontWeight.w600)
    ),
  );
}
