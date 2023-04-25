import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';
import '../constants/textDecoration/text_decoration.dart';
import '../icons/app_icons_widget.dart';

class MenuBoxes extends StatelessWidget {
  const MenuBoxes(
      {Key? key,
      this.onTap,
      this.size,
      this.color,
      this.route,
      this.title,
      this.icons})
      : super(key: key);

  final Color? color;
  final String? title;
  final double? size;
  final String? icons;
  final Function()? onTap;
  final Widget? route;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap ??
          (route != null
              ? () {
                  navigateToPage(context, route);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return route!;
                  // }
                  // ));
                }
              : () {}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color ?? const Color(0xff6236FF)),
              child: Center(
                child: AppIcons(
                  icons: icons,
                  color: appWhite,
                  size: size,
                ),
              )),
          const SizedBox(
            height: 12.5,
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
