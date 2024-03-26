import 'package:flights/app/styling/const.dart';
import 'package:flights/shared/util/intl.dart';
import 'package:flights/shared/widget/custom_container.dart';
import 'package:flights/shared/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDateTimePickerDate extends StatelessWidget {
  const CustomDateTimePickerDate({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        children: [
          const CustomIcon(
            assetPath: 'assets/icons/booking/calendar.svg',
            active: true,
          ),
          SizedBox(width: 8.w),
          Text(
            dateFormatter.format(date),
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
