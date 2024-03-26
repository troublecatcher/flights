import 'package:flights/app/styling/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final BorderRadiusGeometry? borderRadiusGeometry;

  const CustomContainer(
      {super.key, required this.child, this.borderRadiusGeometry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
