import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flight_stat/model/flight_stat.dart';
import 'package:flights/shared/widget/custom_container.dart';
import 'package:flights/shared/widget/custom_icon_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightStatCard extends StatelessWidget {
  final String assetPath;
  final String title;
  final String summary;
  final List<FlightStat> flighStatList;
  final int index;

  const FlightStatCard(
      {super.key,
      required this.assetPath,
      required this.title,
      required this.summary,
      required this.flighStatList,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => context.router.push(
        FlightStatRoute(flightStatList: flighStatList, index: index),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 20.w,
        child: CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconContainer(assetPath: assetPath),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    summary,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
