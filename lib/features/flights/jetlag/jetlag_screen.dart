import 'package:auto_route/auto_route.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/jetlag/cubit/jetlag_cubit.dart';
import 'package:flights/features/settings/controller/notifications_cubit.dart';
import 'package:flights/shared/layout/information_box.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/util/intl.dart';
import 'package:flights/shared/util/native_datetime_picker/native_datetime_picker.dart';
import 'package:flights/shared/util/native_datetime_picker/widgets/custom_datetime_picker.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flights/shared/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class JetlagScreen extends StatefulWidget {
  const JetlagScreen({super.key});

  @override
  State<JetlagScreen> createState() => _JetlagScreenState();
}

class _JetlagScreenState extends State<JetlagScreen> {
  late TextEditingController arrivalController;
  late TextEditingController departureController;
  late DateTime initDate;
  late DateTime date;

  @override
  void initState() {
    super.initState();
    initDate = date = DateTime.now();
    arrivalController = TextEditingController();
    departureController = TextEditingController();
  }

  @override
  void dispose() {
    arrivalController.dispose();
    departureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          previousPageTitle: 'Flights',
          middle: Text('Jet lag helper'),
          border: null,
        ),
        child: SafeArea(
          child: BlocBuilder<NotificationsCubit, bool?>(
            builder: (context, state) {
              if (state!) {
                return BlocBuilder<JetlagCubit, JetlagState>(
                  builder: (context, state) {
                    if (state is JetlagSet) {
                      return Column(
                        children: [
                          Section(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: InformationBox(
                                      title: 'You should go to bed at',
                                      subtitle: timeFormatter.format(date),
                                      assetPath:
                                          'assets/icons/booking/bed_clock.svg',
                                      subtitleTextStyle: TextStyle(
                                        color: accentColor,
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Section(
                            children: [
                              CustomButton(
                                title: 'Clear',
                                onPressed: () =>
                                    context.read<JetlagCubit>().delete(),
                                isActive: true,
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Section(
                            children: [
                              CustomTextField(
                                iconAssetPath: 'assets/icons/booking/earth.svg',
                                placeholder: 'Country of arrival',
                                controller: arrivalController,
                                onChanged: () => setState(() {}),
                              ),
                              SizedBox(height: 8.h),
                              CustomTextField(
                                iconAssetPath: 'assets/icons/booking/earth.svg',
                                placeholder: 'Country of departure',
                                controller: departureController,
                                onChanged: () => setState(() {}),
                              ),
                            ],
                          ),
                          SectionWithTitle(
                            title: 'When do you normally go to sleep?',
                            child: Row(
                              children: [
                                Expanded(
                                    child: CustomDateTimePicker(
                                  initDate: date,
                                  onSave: (newDateTime) => setState(() {
                                    if (newDateTime.isBefore(DateTime.now())) {
                                      date = newDateTime
                                          .add(const Duration(days: 1));
                                    } else {
                                      date = newDateTime;
                                    }
                                  }),
                                  mode: NativePickerMode.time,
                                )),
                                const Expanded(child: SizedBox.shrink()),
                              ],
                            ),
                          ),
                          Section(children: [
                            CustomButton(
                              title: 'Done',
                              onPressed: () =>
                                  context.read<JetlagCubit>().create(date),
                              isActive: arrivalController.text.isNotEmpty &&
                                  departureController.text.isNotEmpty &&
                                  !date.isAtSameMomentAs(initDate),
                            )
                          ]),
                        ],
                      );
                    }
                  },
                );
              } else {
                return const Section(children: [
                  InformationBox(
                    title: 'Notifications turned off',
                    subtitle: 'You can turn them back on in settings',
                    assetPath: 'assets/icons/settings/send_notifications.svg',
                  ),
                ]);
              }
            },
          ),
        ));
  }
}
