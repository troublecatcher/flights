import 'package:flights/app/styling/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

singleFlightSegmentedControlChildren(int groupValue) {
  return {
    0: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/booking/suitcase.svg',
          colorFilter: ColorFilter.mode(
            groupValue == 0 ? Colors.white : secondaryColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          'Fligth',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: groupValue == 0 ? Colors.white : secondaryColor,
          ),
        ),
      ],
    ),
    1: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/notes/notebook.svg',
          colorFilter: ColorFilter.mode(
            groupValue == 1 ? Colors.white : secondaryColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          'Plans',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: groupValue == 1 ? Colors.white : secondaryColor,
          ),
        ),
      ],
    ),
  };
}
