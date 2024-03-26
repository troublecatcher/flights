import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/single_flight/widgets/travel_event_card.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightEventsCard extends StatelessWidget {
  final Flight flight;
  const FlightEventsCard({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TravelEventCard(
          country: flight.departure!.country,
          city: flight.departure!.city,
          dateTime: flight.departure!.dateTime,
          airport: flight.departure!.airport,
          travelEventType: TravelEventType.Departure,
        ),
        SizedBox(width: 8.w),
        TravelEventCard(
          country: flight.arrival!.country,
          city: flight.arrival!.city,
          dateTime: flight.arrival!.dateTime,
          airport: flight.arrival!.airport,
          travelEventType: TravelEventType.Arrival,
        ),
      ],
    );
  }
}
