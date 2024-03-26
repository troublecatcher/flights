import 'package:flights/shared/util/native_datetime_picker/call_bottom_sheet.dart';
import 'package:flights/shared/util/native_datetime_picker/widgets/custom_datetime_picker_date.dart';
import 'package:flights/shared/util/native_datetime_picker/widgets/custom_datetime_picker_time.dart';
import 'package:flights/shared/util/native_datetime_picker/native_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({
    super.key,
    required this.initDate,
    this.minDate,
    this.maxDate,
    required this.onSave,
    required this.mode,
  });

  final DateTime initDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final Function(DateTime) onSave;
  final NativePickerMode mode;

  @override
  Widget build(BuildContext context) {
    switch (mode) {
      case NativePickerMode.dateAndTime:
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => callBottomSheet(
            context,
            onSave: onSave,
            initDate: initDate,
            minDate: minDate,
            maxDate: maxDate,
            mode: mode,
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomDateTimePickerDate(date: initDate),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: CustomDateTimePickerTime(date: initDate),
              ),
            ],
          ),
        );
      case NativePickerMode.date:
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => callBottomSheet(
            context,
            onSave: onSave,
            initDate: initDate,
            minDate: minDate,
            maxDate: maxDate,
            mode: mode,
          ),
          child: CustomDateTimePickerDate(date: initDate),
        );
      case NativePickerMode.time:
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => callBottomSheet(
            context,
            onSave: onSave,
            initDate: initDate,
            minDate: minDate,
            maxDate: maxDate,
            mode: mode,
          ),
          child: CustomDateTimePickerTime(date: initDate),
        );
    }
  }
}
