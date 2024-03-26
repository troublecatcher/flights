import 'package:auto_route/auto_route.dart';
import 'package:flights/features/flights/flights/model/transfer/transfer.dart';
import 'package:flights/features/new_flight/bloc/flight/flight_bloc.dart';
import 'package:flights/features/new_flight/bloc/flight/flight_event.dart';
import 'package:flights/features/new_flight/bloc/transfer/transfer_bloc.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/util/native_datetime_picker/native_datetime_picker.dart';
import 'package:flights/shared/util/native_datetime_picker/widgets/custom_datetime_picker.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flights/shared/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddTransferScreen extends StatefulWidget implements AutoRouteWrapper {
  const AddTransferScreen({super.key});

  @override
  State<AddTransferScreen> createState() => _AddTransferScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferBloc(),
      child: this,
    );
  }
}

class _AddTransferScreenState extends State<AddTransferScreen> {
  late TransferBloc bloc;
  late DateTime arrival = DateTime.now();
  late DateTime departure = DateTime.now();
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController airportController;

  @override
  void initState() {
    super.initState();
    bloc = context.read<TransferBloc>();
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
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Add transfer'),
            border: null,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                SectionWithTitle(
                  title: 'Transfer',
                  child: Column(
                    children: [
                      CustomTextField(
                        iconAssetPath: 'assets/icons/booking/earth.svg',
                        placeholder: 'Country',
                        controller: countryController,
                        onChanged: () =>
                            bloc.add(UpdatedCountry(countryController.text)),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        iconAssetPath: 'assets/icons/booking/city.svg',
                        placeholder: 'City',
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
                    ],
                  ),
                ),
                SectionWithTitle(
                  title: 'Arrival',
                  child: CustomDateTimePicker(
                    minDate:
                        context.read<FlightBloc>().state!.departure!.dateTime,
                    maxDate:
                        context.read<FlightBloc>().state!.arrival!.dateTime,
                    initDate: arrival,
                    onSave: (updatedDateTime) {
                      setState(() {
                        arrival = updatedDateTime;
                      });
                      bloc.add(UpdatedArrivalDateTime(updatedDateTime));
                    },
                    mode: NativePickerMode.dateAndTime,
                  ),
                ),
                SectionWithTitle(
                  title: 'Departure',
                  child: CustomDateTimePicker(
                    minDate:
                        context.read<FlightBloc>().state!.departure!.dateTime,
                    maxDate:
                        context.read<FlightBloc>().state!.arrival!.dateTime,
                    initDate: departure,
                    onSave: (updatedDateTime) {
                      setState(() {
                        departure = updatedDateTime;
                      });
                      bloc.add(UpdatedDepartureDateTime(updatedDateTime));
                    },
                    mode: NativePickerMode.dateAndTime,
                  ),
                ),
                Section(
                  children: [
                    BlocBuilder<TransferBloc, Transfer?>(
                      builder: (context, arrivalState) {
                        return CustomButton(
                          title: 'Done',
                          onPressed: () {
                            context
                                .read<FlightBloc>()
                                .add(AddedTransfer(Transfer(
                                  countryController.text,
                                  cityController.text,
                                  airportController.text,
                                  arrival,
                                  departure,
                                )));
                            context.router.popForced();
                          },
                          isActive: arrivalState!.country.isNotEmpty &&
                              arrivalState.city.isNotEmpty &&
                              arrivalState.airport.isNotEmpty,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
