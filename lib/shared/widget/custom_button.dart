import 'package:flights/app/styling/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isActive;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoButton.filled(
            disabledColor:
                CupertinoTheme.of(context).primaryColor.withOpacity(0.5),
            onPressed: isActive ? onPressed : null,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
