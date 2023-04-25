import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';

// OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
//     gapPadding: 15,
//     borderRadius: BorderRadius.all(
//       Radius.circular(10),
//     ),
//     borderSide: BorderSide(color: Color(0xff372648)));

UnderlineInputBorder underlineInputBorder = const UnderlineInputBorder(
    // borderRadius: BorderRadius.all(
    //   Radius.circular(10),
    // ),
    borderSide: BorderSide(color: Color(0xff372648)));

    UnderlineInputBorder focusedErrorBorder = const UnderlineInputBorder(
    // borderRadius: BorderRadius.all(
    //   Radius.circular(10),
    // ),
    borderSide: BorderSide(color: Colors.red));

UnderlineInputBorder focusedInputBorder = UnderlineInputBorder(
    // borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(width: 1, color: primaryColor));

InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: underlineInputBorder,
    focusedErrorBorder: underlineInputBorder,
    focusedBorder: focusedInputBorder,
    // errorMaxLines: 0,
    errorBorder: underlineInputBorder,
    filled: false,
    enabledBorder: underlineInputBorder,
    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    // fillColor: const Color(0xff141025),
    hintStyle: const TextStyle(
        color: Color(0xff6C757D), fontWeight: FontWeight.w400, fontSize: 15));
