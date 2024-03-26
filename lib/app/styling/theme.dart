import 'package:flights/app/styling/const.dart';
import 'package:flutter/cupertino.dart';

const theme = CupertinoThemeData(
  primaryColor: accentColor,
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  barBackgroundColor: barBackgroundColor,
  textTheme: CupertinoTextThemeData(
    tabLabelTextStyle: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      inherit: false,
    ),
    textStyle: TextStyle(color: accentColor),
    navTitleTextStyle: TextStyle(
      color: primaryColor,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      inherit: false,
    ),
    navLargeTitleTextStyle: TextStyle(
      color: primaryColor,
      fontSize: 34,
      fontWeight: FontWeight.w700,
      inherit: false,
    ),
    navActionTextStyle: TextStyle(
      color: accentColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      inherit: false,
    ),
  ),
);
