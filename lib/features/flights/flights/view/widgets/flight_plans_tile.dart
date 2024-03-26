import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/shared/util/intl.dart';
import 'package:flights/shared/widget/custom_chevron.dart';
import 'package:flights/shared/widget/custom_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightPlansTile extends StatelessWidget {
  const FlightPlansTile({
    super.key,
    required this.flight,
    required this.index,
  });

  final Flight flight;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.h),
        CustomListTile(
          assetPath: 'assets/icons/notes/notebook.svg',
          title: 'Plans',
          trailing: Row(
            children: [
              SizedBox(width: 8.w),
              Text(
                plans(flight.plans!.length),
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const CustomChevron(),
            ],
          ),
          onPressed: (_) => context.router.push(
            SingleFlightRoute(
              index: index,
              openPlans: true,
            ),
          ),
        )
      ],
    );
  }
}
