import 'package:auto_route/auto_route.dart';
import 'package:flights/features/flights/flights/controller/flight_list_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/single_flight/flight/edit/edit_action_sheet.dart';
import 'package:flights/shared/layout/flight_events_tile.dart';
import 'package:flights/features/flights/single_flight/widgets/travel_event_tile.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event_type.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/layout/section_with_title_and_button.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleFlightInfoPage extends StatelessWidget {
  final Flight flight;

  const SingleFlightInfoPage({
    super.key,
    required this.flight,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Section(
                children: [
                  TravelEventTile(
                    flight: flight,
                    travelEventType: TravelEventType.Departure,
                  ),
                  SizedBox(height: 8.h),
                  TravelEventTile(
                    flight: flight,
                    travelEventType: TravelEventType.Arrival,
                  )
                ],
              ),
              SectionWithTitleAndButton(
                title: 'Flight',
                buttonTitle: 'Edit',
                onPressed: () => showCupertinoModalPopup(
                  context: context,
                  builder: (context) => EditActionSheet(flight: flight),
                ),
                child: TravelEventsTile(
                  countryDeparture: flight.departure!.country,
                  countryArrival: flight.arrival!.country,
                  cityDeparture: flight.departure!.city,
                  cityArrival: flight.arrival!.city,
                  dateTimeDeparture: flight.departure!.dateTime,
                  dateTimeArrival: flight.arrival!.dateTime,
                  airportDeparture: flight.departure!.airport,
                  airportArrival: flight.arrival!.airport,
                  reversed: false,
                ),
              ),
              if (flight.transfers.isNotEmpty)
                SectionWithTitle(
                  title: 'Transfers',
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final transfer = flight.transfers[index];
                      return TravelEventsTile(
                        countryDeparture: transfer.country,
                        countryArrival: transfer.country,
                        cityDeparture: transfer.city,
                        cityArrival: transfer.city,
                        dateTimeDeparture: transfer.departure,
                        dateTimeArrival: transfer.arrival,
                        airportDeparture: transfer.airport,
                        airportArrival: transfer.airport,
                        reversed: true,
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(height: 8.h),
                    itemCount: flight.transfers.length,
                  ),
                ),
              Section(
                children: [
                  CustomButton(
                    title: 'Delete record',
                    onPressed: () {
                      context.read<FlightListCubit>().delete(
                            context
                                .read<FlightListCubit>()
                                .state
                                .indexOf(flight),
                          );
                      context.router.popForced();
                    },
                    isActive: true,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
