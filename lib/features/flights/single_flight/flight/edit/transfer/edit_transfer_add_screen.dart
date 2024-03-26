import 'package:auto_route/auto_route.dart';
import 'package:flights/features/flights/flights/model/transfer/transfer.dart';
import 'package:flights/features/flights/single_flight/flight/edit/transfer/transfer_list_cubit.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/util/native_datetime_picker/native_datetime_picker.dart';
import 'package:flights/shared/util/native_datetime_picker/widgets/custom_datetime_picker.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flights/shared/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class EditTransferAddScreen extends StatefulWidget {
  final TransferListCubit cubit;

  const EditTransferAddScreen({super.key, required this.cubit});

  @override
  State<EditTransferAddScreen> createState() => _EditTransferAddScreenState();
}

class _EditTransferAddScreenState extends State<EditTransferAddScreen> {
  late DateTime arrival = DateTime.now();
  late DateTime departure = DateTime.now();
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController airportController;

  @override
  void initState() {
    super.initState();
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
                        onChanged: () => setState(() {}),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        iconAssetPath: 'assets/icons/booking/city.svg',
                        placeholder: 'City',
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
                    ],
                  ),
                ),
                SectionWithTitle(
                  title: 'Arrival',
                  child: CustomDateTimePicker(
                    initDate: arrival,
                    onSave: (updatedDateTime) {
                      setState(() {
                        arrival = updatedDateTime;
                      });
                    },
                    mode: NativePickerMode.dateAndTime,
                  ),
                ),
                SectionWithTitle(
                  title: 'Departure',
                  child: CustomDateTimePicker(
                    initDate: departure,
                    onSave: (updatedDateTime) {
                      setState(() {
                        departure = updatedDateTime;
                      });
                    },
                    mode: NativePickerMode.dateAndTime,
                  ),
                ),
                Section(
                  children: [
                    CustomButton(
                      title: 'Done',
                      onPressed: () {
                        finishAddingTransfer(context);
                      },
                      isActive: countryController.text.isNotEmpty &&
                          cityController.text.isNotEmpty &&
                          airportController.text.isNotEmpty,
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

  void finishAddingTransfer(BuildContext context) {
    final newTransfer = Transfer(
      countryController.text,
      cityController.text,
      airportController.text,
      arrival,
      departure,
    );
    widget.cubit.create(newTransfer);
    context.router.popForced();
  }
}
