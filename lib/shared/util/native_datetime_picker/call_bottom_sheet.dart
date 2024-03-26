import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/shared/util/native_datetime_picker/native_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> callBottomSheet(
  BuildContext context, {
  required DateTime initDate,
  DateTime? minDate,
  DateTime? maxDate,
  required Function(DateTime) onSave,
  required NativePickerMode mode,
}) {
  DateTime newDateTime = initDate;
  return showFlexibleBottomSheet(
    context: context,
    initHeight: 0.8,
    barrierColor: secondaryTextColor,
    bottomSheetColor: Colors.white.withOpacity(0.5),
    bottomSheetBorderRadius: BorderRadius.only(
      topLeft: Radius.circular(10.r),
      topRight: Radius.circular(10.r),
    ),
    builder: (context, _, __) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20.0,
            sigmaY: 20.0,
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 14.h,
                    right: 16.w,
                    left: 16.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(mode == NativePickerMode.time ? 'Time' : 'Date'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CupertinoButton(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            borderRadius: BorderRadius.circular(100),
                            color: surfaceColor,
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () {
                              onSave(newDateTime);
                              context.router.popForced();
                            },
                          ),
                          SizedBox(width: 12.w),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            borderRadius: BorderRadius.circular(100),
                            color: surfaceColor,
                            child: const Icon(
                              Icons.close_rounded,
                              color: primaryColor,
                            ),
                            onPressed: () => context.router.popForced(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: mode != NativePickerMode.time
                      ? NativePicker(
                          mode: mode,
                          tintColor: primaryColor,
                          initDate: initDate,
                          minDate: minDate,
                          maxDate: maxDate,
                          onChanged: (date) => newDateTime = date,
                        )
                      : CupertinoDatePicker(
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (date) => newDateTime = date,
                        ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
