import 'package:flutter/material.dart';

import '../../constants/colors/colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: primaryColor,
    );
  }
}
