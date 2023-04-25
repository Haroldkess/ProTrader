import 'package:crypto_credit/views/themes/input_theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants/colors/colors.dart';
import 'app_bar_theme.dart';

// dark theme parameters
ThemeData darkAppTheme = ThemeData(
    bottomNavigationBarTheme: _darkBottomTheme,
    disabledColor: const Color(0xff6236ff).withOpacity(.15),
    primaryColor: primaryColor,
    dividerColor: const Color(0xff2D1F3B),
    primaryColorLight: appWhite.withOpacity(.7),
    textTheme: _textTheme,
    primaryTextTheme: _primaryTextTheme,
    fontFamily: "Poppins",
    appBarTheme: darkAppBarTheme,
    scaffoldBackgroundColor: background,
    colorScheme: ThemeData.dark()
        .colorScheme
        .copyWith(primary: primaryColor, secondary: secondaryColor),
    backgroundColor: appBlack,
    inputDecorationTheme: darkInputDecorationTheme,
    textButtonTheme: _textButtonThemeData,
    buttonColor: HexColor("#FF396F"),
    canvasColor: Color(0xff040108),
    highlightColor: appWhite,
    primaryIconTheme:  darkIconTheme,
    accentIconTheme: darkAccentIconTheme,
    indicatorColor: Color(0xff3A284C),
    selectedRowColor: Color(0xff662D1F3B), 
    
    );
 
    IconThemeData darkIconTheme = IconThemeData(color: appWhite);
     IconThemeData darkAccentIconTheme = IconThemeData(color: Color(0xff4526b3));

TextButtonThemeData _textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all(appRedColor),
  foregroundColor: MaterialStateProperty.all(appGreen),
));

TextTheme _textTheme = TextTheme(
    titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 7,
        color: appWhite,
        fontWeight: FontWeight.w600));

TextTheme _primaryTextTheme = TextTheme(
    titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 7,
        color: primaryText,
        fontWeight: FontWeight.w600));

BottomNavigationBarThemeData _darkBottomTheme = BottomNavigationBarThemeData(
    backgroundColor: secondaryColor,
    selectedIconTheme: IconThemeData(color: primaryColor),
    unselectedIconTheme: const IconThemeData(color: Colors.grey));

// Light theme parameters

ThemeData lightAppTheme = ThemeData(
    bottomNavigationBarTheme: _lightBottomTheme,
    disabledColor: HexColor("#EFEBFF"),
    primaryColorLight: primaryColor,
    dividerColor: HexColor("#DCDCE9"),
    primaryColor: primaryColor,
    primaryTextTheme: _primaryTextTheme,
    textTheme: _darkTextTheme,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: lightAppBarTheme,
    colorScheme: ThemeData.light()
        .colorScheme
        .copyWith(primary: primaryColor, secondary: appWhite),
    backgroundColor: appWhite,
    inputDecorationTheme: darkInputDecorationTheme,
    textButtonTheme: _textButtonThemeDataLight,
    buttonColor: HexColor("#FF396F"),
    canvasColor: HexColor("#8494A8"),
        highlightColor: HexColor("#8494A8"),
         primaryIconTheme:  lightIconTheme,
    accentIconTheme: lightAccentIconTheme, indicatorColor: appWhite,selectedRowColor: HexColor("#EDEDED"));


          IconThemeData lightIconTheme = IconThemeData(color: HexColor("#6236FF"));
     IconThemeData lightAccentIconTheme = IconThemeData(color: appWhite );

TextTheme _darkTextTheme = TextTheme(
    titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 7,
        color: appBlack,
        fontWeight: FontWeight.w600));

BottomNavigationBarThemeData _lightBottomTheme = BottomNavigationBarThemeData(
    backgroundColor: appWhite,
    selectedIconTheme: IconThemeData(color: primaryColor),
    unselectedIconTheme: IconThemeData(color: darkText));

TextButtonThemeData _textButtonThemeDataLight = TextButtonThemeData(
    style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all(HexColor("#FF396F")),
  foregroundColor: MaterialStateProperty.all(appGreen),
));
