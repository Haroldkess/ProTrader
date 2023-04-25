import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/icons/app_icons_widget.dart';
import 'package:flutter/material.dart';

class BindAPiCards extends StatelessWidget {
  const BindAPiCards(
      {Key? key,
      this.btnColor,
      this.image,
      this.title,
      this.subTitle,
      this.btnText})
      : super(key: key);

  final String? image;
  final Color? btnColor;
  final String? title, subTitle, btnText;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: theme.colorScheme.secondary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIcons(
              image: "$image",
            ),
            const SizedBox(
              height: 15.5,
            ),
            Text(
              "$title",
              style: appTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.titleLarge!.color),
            ),
            const SizedBox(
              height: 11,
            ),
            Center(
              child: Text(
                "$subTitle",
                style: appTextStyle.copyWith(
                    color: lightTextColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 31,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: btnColor),
                onPressed: () {},
                child: Text("$btnText".toUpperCase(),
                    style: appTextStyle.copyWith(
                        fontSize: 10, fontWeight: FontWeight.w500)))
          ],
        ));
  }
}
