import 'package:flights/app/styling/const.dart';
import 'package:flights/shared/widget/custom_container.dart';
import 'package:flights/shared/widget/custom_icon_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetPath;
  final Widget? button;
  final TextStyle? subtitleTextStyle;

  const InformationBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.assetPath,
    this.button,
    this.subtitleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 39.w),
            child: Column(
              children: [
                CustomIconContainer(assetPath: assetPath),
                SizedBox(height: 16.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: subtitleTextStyle ??
                      TextStyle(
                        color: secondaryTextColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          if (button != null)
            Column(
              children: [
                SizedBox(height: 8.h),
                button!,
              ],
            ),
        ],
      ),
    );
  }
}
