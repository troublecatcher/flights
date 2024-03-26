import 'package:flights/app/styling/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String assetPath;
  final bool active;
  const CustomIcon({super.key, required this.assetPath, required this.active});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.r,
      height: 24.r,
      child: SvgPicture.asset(
        assetPath,
        colorFilter: ColorFilter.mode(
          active
              ? CupertinoTheme.of(context).primaryColor
              : tabBarInactiveItemColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
