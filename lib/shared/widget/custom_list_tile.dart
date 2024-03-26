import 'package:flights/app/styling/const.dart';
import 'package:flights/shared/widget/custom_container.dart';
import 'package:flights/shared/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  final String assetPath;
  final String title;
  final Widget trailing;
  final Function(BuildContext)? onPressed;

  const CustomListTile({
    super.key,
    required this.assetPath,
    required this.title,
    required this.trailing,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (onPressed != null) {
      return Builder(builder: (ctx) {
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => onPressed!(ctx),
          child: CustomContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomIcon(
                      assetPath: assetPath,
                      active: true,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      title,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                trailing,
              ],
            ),
          ),
        );
      });
    } else {
      return CustomContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomIcon(
                  assetPath: assetPath,
                  active: true,
                ),
                SizedBox(width: 8.w),
                Text(
                  title,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            trailing,
          ],
        ),
      );
    }
  }
}
