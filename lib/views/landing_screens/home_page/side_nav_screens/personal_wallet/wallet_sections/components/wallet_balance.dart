import 'package:flutter/material.dart';

import '../../../../../../constants/textDecoration/text_decoration.dart';

class WalletBalance extends StatelessWidget {
  const WalletBalance({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text("\$ 0.000",
            style: appTextStyle.copyWith(
                color: theme.textTheme.titleLarge!.color,
                fontSize: 27,
                fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 5,
        ),
        Text("Total Balance",
            style: appTextStyle.copyWith(
                color: theme.textTheme.titleLarge!.color,
                fontSize: 15,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
