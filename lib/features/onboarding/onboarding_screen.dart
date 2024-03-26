import 'package:auto_route/auto_route.dart';
import 'package:flights/app/main.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Section(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'We welcome you!',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Our application can help you easily and conveniently organize your flights.',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/plane.png',
                    height: 400.h,
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Section(
                children: [
                  CustomButton(
                    title: 'Get started',
                    onPressed: () {
                      locator<SharedPreferences>()
                          .setBool('isFirstTime', false);
                      context.router.replace(const FlightsRoute());
                    },
                    isActive: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    child: Text(
                      'Terms of Use',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () =>
                        context.router.push(const TermsOfUseRoute()),
                  ),
                  Text(
                    ' / ',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CupertinoButton(
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () =>
                        context.router.push(const PrivacyPolicyRoute()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
