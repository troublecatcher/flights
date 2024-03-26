import 'package:flights/features/flights/flights/model/transfer/transfer.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event_type.dart';
import 'package:flights/features/flights/single_flight/widgets/travel_event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransferCard extends StatelessWidget {
  final Transfer transfer;
  const TransferCard({super.key, required this.transfer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TravelEventCard(
          country: transfer.country,
          dateTime: transfer.arrival,
          city: transfer.city,
          airport: transfer.airport,
          travelEventType: TravelEventType.Arrival,
        ),
        SizedBox(width: 8.w),
        TravelEventCard(
          country: transfer.country,
          dateTime: transfer.departure,
          city: transfer.city,
          airport: transfer.airport,
          travelEventType: TravelEventType.Departure,
        ),
      ],
    );
  }
}
