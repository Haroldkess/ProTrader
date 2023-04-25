import 'package:flutter/material.dart';

import '../../../../../../constants/colors/colors.dart';
import '../../../../../../constants/textDecoration/text_decoration.dart';
import '../../../../../../icons/app_icons_widget.dart';

class WalletActions extends StatelessWidget {
  final String title;
  final String icon;
  VoidCallback? tap;
   WalletActions({super.key, required this.title, required this.icon, this.tap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: tap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 55,
              width: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff6236FF)),
              child: Center(
                child: AppIcons(
                  icons: icon,
                  color: appWhite,
                  // size: size,
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 93),
            child: Center(
              child: Text(
                "$title",
                style: appTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.titleLarge!.color),
              ),
            ),
          )
        ],
      ),
    );
  }
}
