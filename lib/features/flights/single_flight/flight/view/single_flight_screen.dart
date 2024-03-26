import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flights/controller/flight_list_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/single_flight/flight/view/single_flight_info_page.dart';
import 'package:flights/features/flights/single_flight/plans/single_flight_plans_page.dart';
import 'package:flights/features/flights/single_flight/widgets/segment_control_children.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SingleFlightScreen extends StatefulWidget {
  final int index;
  final bool openPlans;

  const SingleFlightScreen(
      {super.key, required this.index, required this.openPlans});

  @override
  State<SingleFlightScreen> createState() => _SingleFlightScreenState();
}

class _SingleFlightScreenState extends State<SingleFlightScreen>
    with AfterLayoutMixin {
  late PageController pageController;
  int groupValue = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightListCubit, List<Flight>>(
      builder: (context, state) {
        try {
          final flight = state[widget.index];
          return CupertinoPageScaffold(
            backgroundColor: Colors.white,
            navigationBar: CupertinoNavigationBar(
              border: null,
              backgroundColor: Colors.transparent,
              previousPageTitle: 'Flights',
              middle: Column(
                children: [
                  const Text('Flight'),
                  Text(
                    '${flight.departure!.country} - ${flight.arrival!.country}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: secondaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: CupertinoSlidingSegmentedControl(
                              groupValue: groupValue,
                              thumbColor:
                                  CupertinoTheme.of(context).primaryColor,
                              backgroundColor: Colors.transparent,
                              children: singleFlightSegmentedControlChildren(
                                  groupValue),
                              onValueChanged: (value) => setState(() {
                                groupValue = value!;
                                pageController.animateToPage(
                                  groupValue,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeOut,
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: PageView(
                      onPageChanged: (value) =>
                          setState(() => groupValue = value),
                      controller: pageController,
                      children: [
                        SingleFlightInfoPage(flight: flight),
                        SingleFlightPlansPage(flight: flight),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } catch (e) {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (widget.openPlans) {
      groupValue = 1;
      pageController.animateToPage(
        groupValue,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }
}
