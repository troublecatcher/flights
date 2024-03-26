import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/features/flights/jetlag/cubit/jetlag_cubit.dart';
import 'package:flights/features/settings/controller/notifications_cubit.dart';
import 'package:flights/shared/layout/information_box.dart';
import 'package:flights/shared/layout/section.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flights/shared/widget/custom_chevron.dart';
import 'package:flights/shared/widget/custom_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    switchValue = true;
  }

  @override
  Widget build(BuildContext context) {
    bool ableToShare = true;
    return CupertinoPageScaffold(
        child: SafeArea(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Settings'),
            border: null,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Section(children: [
                  InformationBox(
                    title: 'Please share your opinion about our application.',
                    subtitle: 'Your feedback will help us make it even better.',
                    assetPath: 'assets/icons/settings/rate_us.svg',
                    button: CustomButton(
                      title: 'Rate us',
                      onPressed: () async {
                        final InAppReview inAppReview = InAppReview.instance;

                        if (await inAppReview.isAvailable()) {
                          inAppReview.requestReview();
                        }
                      },
                      isActive: true,
                    ),
                  )
                ]),
                Section(
                  children: [
                    CustomListTile(
                      assetPath: 'assets/icons/settings/share.svg',
                      title: 'Share with friends',
                      trailing: const CustomChevron(),
                      onPressed: (ctx) async {
                        if (ableToShare) {
                          ableToShare = false;
                          final box = ctx.findRenderObject() as RenderBox?;
                          await Share.shareWithResult(
                            'Check out this app! <appstorelink>',
                            sharePositionOrigin:
                                box!.localToGlobal(Offset.zero) & box.size,
                          ).whenComplete(() => ableToShare = true);
                        }
                      },
                    ),
                    SizedBox(height: 8.h),
                    CustomListTile(
                      assetPath: 'assets/icons/settings/terms_of_use.svg',
                      title: 'Terms of use',
                      trailing: const CustomChevron(),
                      onPressed: (_) =>
                          context.router.push(const TermsOfUseRoute()),
                    ),
                    SizedBox(height: 8.h),
                    CustomListTile(
                      assetPath: 'assets/icons/settings/privacy_policy.svg',
                      title: 'Privacy Policy',
                      trailing: const CustomChevron(),
                      onPressed: (_) =>
                          context.router.push(const PrivacyPolicyRoute()),
                    ),
                    SizedBox(height: 8.h),
                    CustomListTile(
                      assetPath: 'assets/icons/settings/send_notifications.svg',
                      title: 'Send notifications',
                      trailing: CupertinoSwitch(
                        thumbColor: CupertinoTheme.of(context).primaryColor,
                        activeColor: CupertinoTheme.of(context)
                            .primaryColor
                            .withOpacity(0.14),
                        trackColor: Colors.white,
                        value: switchValue,
                        onChanged: (value) => setState(() {
                          switchValue = value;
                          context.read<NotificationsCubit>().set(value);
                          if (value == false) {
                            context.read<JetlagCubit>().delete();
                          }
                        }),
                      ),
                      onPressed: null,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
