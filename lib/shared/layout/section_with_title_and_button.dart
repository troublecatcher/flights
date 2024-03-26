import 'package:flights/app/styling/const.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flights/shared/widget/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionWithTitleAndButton extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function() onPressed;
  final Widget child;

  const SectionWithTitleAndButton({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CustomTextButton(
                  title: buttonTitle,
                  onPressed: onPressed,
                ),
              ],
            ),
            child,
          ],
        )
      ],
    );
  }
}
