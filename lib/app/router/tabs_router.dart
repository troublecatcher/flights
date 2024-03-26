import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/shared/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class TabBarWrapperScreen extends StatelessWidget {
  const TabBarWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        FlightsRoute(),
        DepartureRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return CupertinoTabBar(
          border: null,
          backgroundColor: surfaceColor,
          activeColor: CupertinoTheme.of(context).primaryColor,
          currentIndex: tabsRouter.activeIndex,
          onTap: (value) {
            tabsRouter.setActiveIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: CustomIcon(
                assetPath: 'assets/icons/airplane/airplane.svg',
                active: false,
              ),
              activeIcon: CustomIcon(
                assetPath: 'assets/icons/airplane/airplane.svg',
                active: true,
              ),
              label: 'Flights',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                assetPath: 'assets/icons/airplane/airplane_plus.svg',
                active: false,
              ),
              activeIcon: CustomIcon(
                assetPath: 'assets/icons/airplane/airplane_plus.svg',
                active: true,
              ),
              label: 'New flight',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                assetPath: 'assets/icons/settings/cog.svg',
                active: false,
              ),
              activeIcon: CustomIcon(
                assetPath: 'assets/icons/settings/cog.svg',
                active: true,
              ),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
