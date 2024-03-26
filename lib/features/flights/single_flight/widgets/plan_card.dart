import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flights/model/plan/plan.dart';
import 'package:flights/shared/widget/custom_container.dart';
import 'package:flights/shared/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanCard extends StatelessWidget {
  final Plan plan;
  const PlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
                flex: 1,
                child: CustomIcon(
                  assetPath: 'assets/icons/notes/note.svg',
                  active: true,
                )),
            SizedBox(width: 8.w),
            Expanded(
              flex: 10,
              child: Text(
                plan.title,
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Expanded(
              child: CustomContainer(
                child: Text(
                  plan.description,
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
