import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/icons/app_icons_widget.dart';
import 'package:flutter/material.dart';

class IconsCircle extends StatelessWidget {
  const IconsCircle({Key? key, this.onTap, this.title, this.color, this.icon})
      : super(key: key);

  final Color? color;
  final String? icon;
  final String? title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.accentIconTheme.color),
            height: 38,
            width: 38,
            child: Center(
              child: AppIcons(
                icons: icon,
                color: theme.primaryIconTheme.color,
                size: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 7.5,
          ),
          Text(
            "$title",
            style: appTextStyle.copyWith(
                fontStyle: FontStyle.normal,
                fontSize: 11,
                fontWeight: FontWeight.w300,
                color: appWhite.withOpacity(.6)),
          )
        ],
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    this.size,
    this.color,
    this.iconData,
  }) : super(key: key);

  final Color? color;
  final IconData? iconData;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: size ?? 36,
        width: size ?? 36,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: color ?? const Color(0xff6236FF)),
        child: Center(
          child: Icon(
            iconData,
            color: appWhite,
          ),
        ));
  }
}
