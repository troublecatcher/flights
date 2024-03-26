import 'package:flights/app/styling/const.dart';
import 'package:flutter/cupertino.dart';

const theme = CupertinoThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  barBackgroundColor: barBackgroundColor,
  textTheme: CupertinoTextThemeData(
    tabLabelTextStyle: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
    textStyle: TextStyle(color: primaryColor),
    navTitleTextStyle: TextStyle(
      color: primaryTextColor,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    navLargeTitleTextStyle: TextStyle(
      color: primaryTextColor,
      fontSize: 34,
      fontWeight: FontWeight.w700,
    ),
    navActionTextStyle: TextStyle(
      color: primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      inherit: false,
    ),
  ),
);
