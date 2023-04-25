import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';

class SideNavTitle extends StatelessWidget {
  const SideNavTitle({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
      child: Text(
        "$title",
        style: appTextStyle.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: const Color(0xff8F82A5)),
      ),
    );
  }
}
