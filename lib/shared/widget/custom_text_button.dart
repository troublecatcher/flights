import 'package:flights/app/styling/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double? fontSize;

  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: primaryColor,
          fontSize: fontSize ?? 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
