import 'package:auto_route/auto_route.dart';
import 'package:flights/features/flights/flights/controller/flight_list_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event.dart';
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
class EditDepartureScreen extends StatefulWidget {
  final Flight flight;
  const EditDepartureScreen({super.key, required this.flight});

  @override
  State<EditDepartureScreen> createState() => _EditDepartureScreenState();
}

class _EditDepartureScreenState extends State<EditDepartureScreen> {
  late DateTime dateTime;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController airportController;

  @override
  void initState() {
    super.initState();
    final departure = widget.flight.departure!;
    countryController = TextEditingController(text: departure.country);
    cityController = TextEditingController(text: departure.city);
    airportController = TextEditingController(text: departure.airport);
    dateTime = departure.dateTime;
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
            largeTitle: const Text('Edit flight'),
            border: null,
            trailing: CustomTextButton(
              title: 'Clear',
              onPressed: () {
                countryController.clear();
                cityController.clear();
                airportController.clear();
                dateTime = DateTime.now();
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
                        onChanged: () => setState(() {}),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        iconAssetPath: 'assets/icons/booking/city.svg',
                        placeholder: 'City of departure',
                        controller: cityController,
                        onChanged: () => setState(() {}),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        iconAssetPath: 'assets/icons/airplane/airport.svg',
                        placeholder: 'Airport name',
                        controller: airportController,
                        onChanged: () => setState(() {}),
                      ),
                      SizedBox(height: 8.h),
                      CustomDateTimePicker(
                        initDate: dateTime,
                        onSave: (updatedDateTime) {
                          setState(() {
                            dateTime = updatedDateTime;
                          });
                        },
                        mode: NativePickerMode.dateAndTime,
                      ),
                      SizedBox(height: 16.h),
                      CustomButton(
                        title: 'Save',
                        onPressed: () {
                          finishEditingDeparture(context);
                        },
                        isActive: countryController.text.isNotEmpty &&
                            cityController.text.isNotEmpty &&
                            airportController.text.isNotEmpty,
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

  void finishEditingDeparture(BuildContext context) {
    final cubit = context.read<FlightListCubit>();
    final index = cubit.state.indexOf(widget.flight);
    final newDeparture = TravelEvent(
      countryController.text,
      cityController.text,
      airportController.text,
      dateTime,
    );
    cubit.update(index, widget.flight.copyWith(departure: newDeparture));
    context.router.popForced();
  }
}
