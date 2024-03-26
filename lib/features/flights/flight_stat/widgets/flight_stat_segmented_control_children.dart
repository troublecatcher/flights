import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flight_stat/model/flight_stat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Map<int, Widget> flightStatSegmentedControlChildren(
    List<FlightStat> flighStatList, int groupValue) {
  return Map.fromEntries(
    flighStatList.asMap().entries.map(
      (entry) {
        final index = entry.key;
        final flightStat = entry.value;
        final color = groupValue == index ? Colors.white : secondaryColor;
        return MapEntry(
            index,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  flightStat.assetPath,
                  colorFilter: ColorFilter.mode(
                    color,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    flightStat.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                ),
              ],
            ));
      },
    ),
  );
}
