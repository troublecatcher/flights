import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event.dart';
import 'package:flights/features/new_flight/bloc/flight/flight_bloc.dart';
import 'package:flights/features/new_flight/bloc/flight/flight_event.dart';
import 'package:flights/features/new_flight/bloc/travel_event/travel_event_event.dart';
import 'package:flights/features/new_flight/bloc/travel_event/travel_event_bloc.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/util/native_datetime_picker/native_datetime_picker.dart';
import 'package:flights/shared/util/native_datetime_picker/widgets/custom_datetime_picker.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flights/shared/widget/custom_text_button.dart';
import 'package:flights/shared/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DepartureScreen extends StatefulWidget implements AutoRouteWrapper {
  const DepartureScreen({super.key});

  @override
  State<DepartureScreen> createState() => _DepartureScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => TravelEventBloc(),
      child: this,
    );
  }
}

class _DepartureScreenState extends State<DepartureScreen> {
  late TravelEventBloc bloc;
  late DateTime dateTime = DateTime.now();

  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController airportController;

  @override
  void initState() {
    super.initState();
    bloc = context.read<TravelEventBloc>();
    countryController = TextEditingController();
    cityController = TextEditingController();
    airportController = TextEditingController();
  }

  @override
  void dispose() {
    countryController.dispose();
    cityController.dispose();
    airportController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: const Text('New flight'),
            border: null,
            trailing: CustomTextButton(
              title: 'Clear',
              onPressed: () {
                countryController.clear();
                cityController.clear();
                airportController.clear();
                dateTime = DateTime.now();
                bloc.add(ClearTravelEvent());
              },
              fontSize: 16,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionWithTitle(
                  title: 'Departure from origin',
                  child: Column(
                    children: [
                      CustomTextField(
                        iconAssetPath: 'assets/icons/booking/earth.svg',
                        placeholder: 'Country of departure',
                        controller: countryController,
                        onChanged: () =>
                            bloc.add(UpdatedCountry(countryController.text)),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        iconAssetPath: 'assets/icons/booking/city.svg',
                        placeholder: 'City of departure',
                        controller: cityController,
                        onChanged: () =>
                            bloc.add(UpdatedCity(cityController.text)),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        iconAssetPath: 'assets/icons/airplane/airport.svg',
                        placeholder: 'Airport name',
                        controller: airportController,
                        onChanged: () =>
                            bloc.add(UpdatedAirport(airportController.text)),
                      ),
                      SizedBox(height: 8.h),
                      CustomDateTimePicker(
                        initDate: dateTime,
                        minDate: dateTime,
                        onSave: (updatedDateTime) {
                          setState(() {
                            dateTime = updatedDateTime;
                          });
                          bloc.add(UpdatedDateTime(updatedDateTime));
                        },
                        mode: NativePickerMode.dateAndTime,
                      ),
                      SizedBox(height: 16.h),
                      BlocBuilder<TravelEventBloc, TravelEvent?>(
                        builder: (context, departureState) {
                          return CustomButton(
                            title: 'Next',
                            onPressed: () {
                              context
                                  .read<FlightBloc>()
                                  .add(UpdatedDeparture(departureState));
                              context.router
                                  .push(const NewFlightArrivalRoute());
                            },
                            isActive: departureState!.country.isNotEmpty &&
                                departureState.city.isNotEmpty &&
                                departureState.airport.isNotEmpty,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
