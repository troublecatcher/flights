import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event_type.dart';
import 'package:flights/shared/util/intl.dart';
import 'package:flights/shared/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravelEventCard extends StatelessWidget {
  final String country;
  final DateTime dateTime;
  final String city;
  final String airport;
  final TravelEventType travelEventType;

  const TravelEventCard({
    super.key,
    required this.country,
    required this.dateTime,
    required this.city,
    required this.airport,
    required this.travelEventType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 20.w,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: CupertinoTheme.of(context).primaryColor.withOpacity(0.14),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  travelEventType.name,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CustomIcon(assetPath: travelEventType.assetPath, active: true),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 40.w,
                      child: Text(
                        '$country, $city',
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      timeFormatter.format(dateTime),
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      dateFormatter.format(dateTime),
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 26.h),
                    Text(
                      'Airport',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 40.w,
                      child: Text(
                        airport,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
