import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flight_stat/model/flight_stat.dart';
import 'package:flights/features/flights/flight_stat/widgets/flight_stat_segmented_control_children.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class FlightStatScreen extends StatefulWidget {
  final List<FlightStat> flightStatList;
  final int? index;
  const FlightStatScreen({super.key, required this.flightStatList, this.index});

  @override
  State<FlightStatScreen> createState() => _FlightStatScreenState();
}

class _FlightStatScreenState extends State<FlightStatScreen>
    with AfterLayoutMixin {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: const CupertinoNavigationBar(
        border: null,
        backgroundColor: Colors.transparent,
        previousPageTitle: 'Flights',
        middle: Column(
          children: [
            Text('Flight'),
            Text(
              'Statistics',
              style: TextStyle(
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
                        thumbColor: CupertinoTheme.of(context).primaryColor,
                        backgroundColor: Colors.transparent,
                        children: flightStatSegmentedControlChildren(
                            widget.flightStatList, groupValue),
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
                onPageChanged: (value) => setState(() => groupValue = value),
                controller: pageController,
                children:
                    List.generate(widget.flightStatList.length, (pageIndex) {
                  final flightStat = widget.flightStatList[pageIndex];
                  return SingleChildScrollView(
                    child: SectionWithTitle(
                      title: flightStat.title,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, listIndex) {
                          BorderRadiusGeometry borderRadiusGeometry =
                              BorderRadius.zero;
                          if (flightStat.data.length > 1) {
                            if (listIndex == 0) {
                              borderRadiusGeometry = BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r));
                            }
                            if (listIndex == flightStat.data.length - 1) {
                              borderRadiusGeometry = BorderRadius.only(
                                  bottomLeft: Radius.circular(10.r),
                                  bottomRight: Radius.circular(10.r));
                            }
                          } else {
                            borderRadiusGeometry = BorderRadius.circular(10.r);
                          }
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 8.w),
                            decoration: BoxDecoration(
                              borderRadius: borderRadiusGeometry,
                              color: surfaceColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      CustomIcon(
                                        assetPath: flightStat.listAssetPath,
                                        active: true,
                                      ),
                                      SizedBox(width: 8.w),
                                      Expanded(
                                        child: Text(
                                          flightStat.data.keys
                                              .toList()[listIndex],
                                          style: TextStyle(
                                            color: pageIndex == 0
                                                ? primaryTextColor
                                                : secondaryTextColor,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    flightStat.data.values.toList()[listIndex],
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          height: 0,
                          thickness: 1,
                          color: secondaryTextColor,
                          indent: 16.w,
                          endIndent: 16.w,
                        ),
                        itemCount: flightStat.data.length,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (widget.index != null) {
      groupValue = widget.index!;
      pageController.animateToPage(
        groupValue,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }
}
