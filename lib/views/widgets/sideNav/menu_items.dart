import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/icons/app_icons_widget.dart';
import 'package:flutter/material.dart';

class NavItems extends StatelessWidget {
  const NavItems(
      {Key? key, this.size, this.route, this.icon, this.title, this.onTap})
      : super(key: key);
  final String? icon;
  final String? title;
  final double? size;
  final VoidCallback? route;
  final Widget? onTap;
  @override
  Widget build(BuildContext context) {
       var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (route != null) route!();
        if (onTap != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return onTap!;
          }));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 010),
        child: Row(
          children: [
            Container(
                height: 38,
                width: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff4526b3),
                ),
                child: Center(
                  child: AppIcons(
                    icons: icon,
                    color: appWhite,
                    size: size,
                  ),
                )),
            const SizedBox(
              width: 16,
            ),
            Text(
              "$title",
              style: appTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400, color: theme.textTheme.titleLarge!.color),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_sharp,
              color: lightTextColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
