import 'package:flights/app/styling/const.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionWithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  const SectionWithTitle({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Section(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            child,
          ],
        )
      ],
    );
  }
}
