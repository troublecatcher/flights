import 'package:flights/shared/layout/travel_event_card.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravelEventsTile extends StatelessWidget {
  final String countryDeparture;
  final String countryArrival;
  final String cityDeparture;
  final String cityArrival;
  final DateTime dateTimeDeparture;
  final DateTime dateTimeArrival;
  final String airportDeparture;
  final String airportArrival;
  final bool reversed;
  const TravelEventsTile({
    super.key,
    required this.countryDeparture,
    required this.countryArrival,
    required this.cityDeparture,
    required this.cityArrival,
    required this.dateTimeDeparture,
    required this.dateTimeArrival,
    required this.airportDeparture,
    required this.airportArrival,
    required this.reversed,
  });

  @override
  Widget build(BuildContext context) {
    final children = [
      TravelEventCard(
        country: countryDeparture,
        city: cityDeparture,
        dateTime: dateTimeDeparture,
        airport: airportDeparture,
        travelEventType: TravelEventType.Departure,
      ),
      SizedBox(width: 8.w),
      TravelEventCard(
        country: countryArrival,
        city: cityArrival,
        dateTime: dateTimeArrival,
        airport: airportArrival,
        travelEventType: TravelEventType.Arrival,
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: reversed ? children.reversed.toList() : children,
    );
  }
}
