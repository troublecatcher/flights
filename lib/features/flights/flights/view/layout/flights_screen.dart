import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/features/flights/flights/controller/flight_stat_cubit.dart';
import 'package:flights/features/flights/flights/controller/flight_list_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/flight_stat/model/flight_stat.dart';
import 'package:flights/features/flights/flight_stat/widgets/flight_stat_card.dart';
import 'package:flights/features/flights/flights/view/widgets/flight_card.dart';
import 'package:flights/features/flights/flights/view/widgets/flight_plans_tile.dart';
import 'package:flights/features/flights/jetlag/cubit/jetlag_cubit.dart';
import 'package:flights/features/settings/controller/notifications_cubit.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/layout/section_with_title_and_button.dart';
import 'package:flights/shared/util/intl.dart';
import 'package:flights/shared/layout/information_box.dart';
import 'package:flights/shared/widget/custom_button_transparent.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flights/shared/widget/custom_container.dart';
import 'package:flights/shared/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class FlightsScreen extends StatelessWidget {
  const FlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Flights'),
            border: null,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                BlocBuilder<NotificationsCubit, bool?>(
                  builder: (context, state) {
                    if (state!) {
                      return Section(
                        children: [
                          BlocBuilder<JetlagCubit, JetlagState>(
                            builder: (context, state) {
                              if (state is JetlagSet) {
                                return CustomContainer(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          timeFormatter.format(state.dateTime),
                                          style: TextStyle(
                                            color: accentColor,
                                            fontSize: 40.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const CustomIcon(
                                                assetPath:
                                                    'assets/icons/booking/bed_clock.svg',
                                                active: true),
                                            SizedBox(width: 4.w),
                                            Text(
                                              'We’ll wake you up',
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        CustomTransparentButton(
                                          title: 'Cancel',
                                          onPressed: () => context
                                              .read<JetlagCubit>()
                                              .delete(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ));
                              } else {
                                return InformationBox(
                                  title: 'Jet lag helper',
                                  subtitle:
                                      'Helps determine the optimal time for sleep and improve your adaptation.',
                                  assetPath:
                                      'assets/icons/booking/bed_clock.svg',
                                  button: CustomButton(
                                    title: 'Set notification',
                                    onPressed: () => context.router
                                        .push(const JetlagRoute()),
                                    isActive: true,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                BlocBuilder<FlightListCubit, List<Flight>>(
                  builder: (context, state) {
                    if (state.isNotEmpty) {
                      final flight = state.last;
                      return SectionWithTitleAndButton(
                        title: 'Recent flights',
                        buttonTitle: 'All flights',
                        onPressed: () =>
                            context.router.push(const FlightsAllRoute()),
                        child: Column(
                          children: [
                            FlightCard(
                              flight: flight,
                              index: state.length - 1,
                              openFlans: false,
                            ),
                            if (flight.plans!.isNotEmpty)
                              FlightPlansTile(
                                flight: flight,
                                index: state.length - 1,
                              ),
                          ],
                        ),
                      );
                    } else {
                      return const SectionWithTitle(
                          title: 'Recent flights',
                          child: InformationBox(
                            title: 'No added flight yet',
                            subtitle:
                                'Tap New flight in tab bar below to necessary details about your first flight.',
                            assetPath:
                                'assets/icons/airplane/airplane_plus.svg',
                          ));
                    }
                  },
                ),
                BlocBuilder<FlightStatCubit, List<FlightStat>>(
                  builder: (context, state) {
                    return SectionWithTitleAndButton(
                      title: 'Flight statistics',
                      buttonTitle: 'See all',
                      onPressed: () => context.router
                          .push(FlightStatRoute(flightStatList: state)),
                      child: Wrap(
                        spacing: 8.r,
                        runSpacing: 8.r,
                        children: List.generate(
                          state.length,
                          (index) => FlightStatCard(
                            assetPath: state[index].assetPath,
                            title: state[index].title,
                            summary: state[index].summary,
                            flighStatList: state,
                            index: index,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
