import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  SettingsCard(
      {Key? key,
      this.title,
      this.route,
      this.subTitle,
      this.onTap,
      this.tap,
      this.trailing})
      : super(key: key);

  final String? title;
  final Widget? onTap;
  final Widget? trailing;
  final String? subTitle;
  final VoidCallback? route;
  VoidCallback? tap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        // isThreeLine: subTitle == null ? false : true,
        tileColor: theme.colorScheme.secondary,
        trailing: trailing ?? const Icon(Icons.chevron_right_rounded),
        subtitle: subTitle == null
            ? null
            : Text(
                subTitle!,
                style: appTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
        title: Text(
          title!,
          style: appTextStyle.copyWith(
            color: theme.textTheme.titleLarge!.color,
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
        ),
        onTap: tap
        // () {
        //   if (route != null) route!();
        //   if (onTap != null) {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => onTap!));
        //   }
        // },
        );
  }
}
