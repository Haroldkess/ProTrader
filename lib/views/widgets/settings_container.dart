import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({Key? key, this.children, this.hP, this.vP})
      : super(key: key);
  final List<Widget>? children;
  final double? hP, vP;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: hP ?? 0, vertical: vP ?? 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Theme.of(context).colorScheme.secondary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children!,
        ));
  }
}

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.09, top: 14.5),
      child: Text(
        title!,
        style: appTextStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xff8F82A5)),
      ),
    );
  }
}
