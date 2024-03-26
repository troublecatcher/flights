import 'package:flights/app/styling/const.dart';
import 'package:flights/shared/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String? iconAssetPath;
  final String placeholder;
  final TextEditingController controller;
  final Function()? onChanged;
  final int? lines;

  const CustomTextField({
    super.key,
    this.iconAssetPath,
    required this.placeholder,
    required this.controller,
    this.onChanged,
    this.lines,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = false;
    widget.controller.addListener(listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listener);
    super.dispose();
  }

  listener() {
    setState(() => isActive = widget.controller.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    double height = 48.h;
    if (widget.lines != null) {
      height += widget.lines! * 11.h;
    }
    return SizedBox(
      height: height,
      child: CupertinoTextField(
        maxLines: widget.lines,
        onChanged:
            widget.onChanged != null ? (value) => widget.onChanged!() : null,
        style: TextStyle(
          color: primaryColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        controller: widget.controller,
        prefix: widget.iconAssetPath != null
            ? Row(
                children: [
                  SizedBox(width: 8.w),
                  CustomIcon(
                    assetPath: widget.iconAssetPath!,
                    active: isActive,
                  ),
                ],
              )
            : null,
        placeholder: widget.placeholder,
        decoration: BoxDecoration(
          color: surfaceColor,
          border: null,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
