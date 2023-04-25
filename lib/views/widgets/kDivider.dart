import 'package:flutter/material.dart';

class KDivider extends StatelessWidget {
  const KDivider({Key? key, this.padding, this.hP}) : super(key: key);
  final double? padding, hP;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:hP ?? 16, vertical: padding ?? 0),
      child:  Divider(
        thickness: 2.0,
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
