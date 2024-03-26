import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/shared/util/intl.dart';
import 'package:flights/shared/widget/custom_button_transparent.dart';
import 'package:flights/shared/widget/custom_container.dart';
import 'package:flights/shared/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({
    super.key,
    required this.flight,
    required this.index,
    required this.openFlans,
  });

  final Flight flight;
  final int index;
  final bool openFlans;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                flight.departure!.city,
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Text(
                flight.arrival!.city,
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                flight.departure!.country,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Text(
                flight.arrival!.country,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              timeFormatter.format(flight.departure!.dateTime),
              style: TextStyle(
                color: primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomIcon(
                  assetPath: 'assets/icons/airplane/airplane.svg',
                  active: true,
                ),
                SizedBox(width: 4.w),
                Text(
                  formatDuration(
                    flight.arrival!.dateTime.difference(
                      flight.departure!.dateTime,
                    ),
                  ),
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Text(
              timeFormatter.format(flight.arrival!.dateTime),
              style: TextStyle(
                color: primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTransparentButton(
              title: 'See details',
              onPressed: () => context.router.push(
                SingleFlightRoute(
                  index: index,
                  openPlans: openFlans,
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
