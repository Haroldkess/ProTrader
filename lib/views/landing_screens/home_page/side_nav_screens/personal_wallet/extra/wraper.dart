import 'package:flutter/material.dart';

class ViewWrapper extends StatelessWidget {
  final Widget child;
  const ViewWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(15)
      ),
      child: child,
    );
  }
}
