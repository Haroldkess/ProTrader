 
import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';
import '../constants/textDecoration/text_decoration.dart'; 

AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    toolbarHeight: kToolbarHeight,
    backgroundColor: darkBackground,
    iconTheme: iconThemeData,
    titleSpacing: 1,
    foregroundColor: appBlack,
    titleTextStyle: appTextStyle);


    AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    
    toolbarHeight: kToolbarHeight,
    backgroundColor: background,
    iconTheme: iconThemeData,
    titleSpacing: 1,
    foregroundColor: appBlack,
    titleTextStyle: appTextStyle);

IconThemeData iconThemeData = IconThemeData(
  color: appWhite,
  size: 24,
);
