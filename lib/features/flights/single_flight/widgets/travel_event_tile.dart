import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event_type.dart';
import 'package:flights/shared/widget/custom_container.dart';
import 'package:flights/shared/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravelEventTile extends StatelessWidget {
  final Flight flight;
  final TravelEventType travelEventType;
  const TravelEventTile(
      {super.key, required this.flight, required this.travelEventType});

  @override
  Widget build(BuildContext context) {
    String? title;
    String? country;
    String? city;
    switch (travelEventType) {
      case TravelEventType.Departure:
        title = 'From';
        country = flight.departure!.country;
        city = flight.departure!.city;
        break;
      case TravelEventType.Arrival:
        title = 'To';
        country = flight.arrival!.country;
        city = flight.arrival!.city;
        break;
      default:
    }
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  city!,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    const CustomIcon(
                      assetPath: 'assets/icons/airplane/airplane_marker.svg',
                      active: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  country!,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
