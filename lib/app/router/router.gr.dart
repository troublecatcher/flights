// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddPlansRoute.name: (routeData) {
      final args = routeData.argsAs<AddPlansRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddPlansScreen(
          key: args.key,
          flight: args.flight,
          plan: args.plan,
        ),
      );
    },
    AddTransferRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AddTransferScreen()),
      );
    },
    DepartureRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const DepartureScreen()),
      );
    },
    EditArrivalRoute.name: (routeData) {
      final args = routeData.argsAs<EditArrivalRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditArrivalScreen(
          key: args.key,
          flight: args.flight,
        ),
      );
    },
    EditDepartureRoute.name: (routeData) {
      final args = routeData.argsAs<EditDepartureRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditDepartureScreen(
          key: args.key,
          flight: args.flight,
        ),
      );
    },
    EditTransferAddRoute.name: (routeData) {
      final args = routeData.argsAs<EditTransferAddRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditTransferAddScreen(
          key: args.key,
          cubit: args.cubit,
        ),
      );
    },
    EditTransferRoute.name: (routeData) {
      final args = routeData.argsAs<EditTransferRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: EditTransferScreen(
          key: args.key,
          flight: args.flight,
        )),
      );
    },
    FlightStatRoute.name: (routeData) {
      final args = routeData.argsAs<FlightStatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FlightStatScreen(
          key: args.key,
          flightStatList: args.flightStatList,
          index: args.index,
        ),
      );
    },
    FlightsAllRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FlightsAllScreen(),
      );
    },
    FlightsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FlightsScreen(),
      );
    },
    FlightsWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FlightsWrapperScreen(),
      );
    },
    JetlagRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JetlagScreen(),
      );
    },
    NewFlightArrivalRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const NewFlightArrivalScreen()),
      );
    },
    NewFlightTransfersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewFlightTransfersScreen(),
      );
    },
    NewFlightWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewFlightWrapperScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    PromotionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PromotionScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SingleFlightRoute.name: (routeData) {
      final args = routeData.argsAs<SingleFlightRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SingleFlightScreen(
          key: args.key,
          index: args.index,
          openPlans: args.openPlans,
        ),
      );
    },
    TabBarWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabBarWrapperScreen(),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [AddPlansScreen]
class AddPlansRoute extends PageRouteInfo<AddPlansRouteArgs> {
  AddPlansRoute({
    Key? key,
    required Flight flight,
    Plan? plan,
    List<PageRouteInfo>? children,
  }) : super(
          AddPlansRoute.name,
          args: AddPlansRouteArgs(
            key: key,
            flight: flight,
            plan: plan,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPlansRoute';

  static const PageInfo<AddPlansRouteArgs> page =
      PageInfo<AddPlansRouteArgs>(name);
}

class AddPlansRouteArgs {
  const AddPlansRouteArgs({
    this.key,
    required this.flight,
    this.plan,
  });

  final Key? key;

  final Flight flight;

  final Plan? plan;

  @override
  String toString() {
    return 'AddPlansRouteArgs{key: $key, flight: $flight, plan: $plan}';
  }
}

/// generated route for
/// [AddTransferScreen]
class AddTransferRoute extends PageRouteInfo<void> {
  const AddTransferRoute({List<PageRouteInfo>? children})
      : super(
          AddTransferRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTransferRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DepartureScreen]
class DepartureRoute extends PageRouteInfo<void> {
  const DepartureRoute({List<PageRouteInfo>? children})
      : super(
          DepartureRoute.name,
          initialChildren: children,
        );

  static const String name = 'DepartureRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditArrivalScreen]
class EditArrivalRoute extends PageRouteInfo<EditArrivalRouteArgs> {
  EditArrivalRoute({
    Key? key,
    required Flight flight,
    List<PageRouteInfo>? children,
  }) : super(
          EditArrivalRoute.name,
          args: EditArrivalRouteArgs(
            key: key,
            flight: flight,
          ),
          initialChildren: children,
        );

  static const String name = 'EditArrivalRoute';

  static const PageInfo<EditArrivalRouteArgs> page =
      PageInfo<EditArrivalRouteArgs>(name);
}

class EditArrivalRouteArgs {
  const EditArrivalRouteArgs({
    this.key,
    required this.flight,
  });

  final Key? key;

  final Flight flight;

  @override
  String toString() {
    return 'EditArrivalRouteArgs{key: $key, flight: $flight}';
  }
}

/// generated route for
/// [EditDepartureScreen]
class EditDepartureRoute extends PageRouteInfo<EditDepartureRouteArgs> {
  EditDepartureRoute({
    Key? key,
    required Flight flight,
    List<PageRouteInfo>? children,
  }) : super(
          EditDepartureRoute.name,
          args: EditDepartureRouteArgs(
            key: key,
            flight: flight,
          ),
          initialChildren: children,
        );

  static const String name = 'EditDepartureRoute';

  static const PageInfo<EditDepartureRouteArgs> page =
      PageInfo<EditDepartureRouteArgs>(name);
}

class EditDepartureRouteArgs {
  const EditDepartureRouteArgs({
    this.key,
    required this.flight,
  });

  final Key? key;

  final Flight flight;

  @override
  String toString() {
    return 'EditDepartureRouteArgs{key: $key, flight: $flight}';
  }
}

/// generated route for
/// [EditTransferAddScreen]
class EditTransferAddRoute extends PageRouteInfo<EditTransferAddRouteArgs> {
  EditTransferAddRoute({
    Key? key,
    required TransferListCubit cubit,
    List<PageRouteInfo>? children,
  }) : super(
          EditTransferAddRoute.name,
          args: EditTransferAddRouteArgs(
            key: key,
            cubit: cubit,
          ),
          initialChildren: children,
        );

  static const String name = 'EditTransferAddRoute';

  static const PageInfo<EditTransferAddRouteArgs> page =
      PageInfo<EditTransferAddRouteArgs>(name);
}

class EditTransferAddRouteArgs {
  const EditTransferAddRouteArgs({
    this.key,
    required this.cubit,
  });

  final Key? key;

  final TransferListCubit cubit;

  @override
  String toString() {
    return 'EditTransferAddRouteArgs{key: $key, cubit: $cubit}';
  }
}

/// generated route for
/// [EditTransferScreen]
class EditTransferRoute extends PageRouteInfo<EditTransferRouteArgs> {
  EditTransferRoute({
    Key? key,
    required Flight flight,
    List<PageRouteInfo>? children,
  }) : super(
          EditTransferRoute.name,
          args: EditTransferRouteArgs(
            key: key,
            flight: flight,
          ),
          initialChildren: children,
        );

  static const String name = 'EditTransferRoute';

  static const PageInfo<EditTransferRouteArgs> page =
      PageInfo<EditTransferRouteArgs>(name);
}

class EditTransferRouteArgs {
  const EditTransferRouteArgs({
    this.key,
    required this.flight,
  });

  final Key? key;

  final Flight flight;

  @override
  String toString() {
    return 'EditTransferRouteArgs{key: $key, flight: $flight}';
  }
}

/// generated route for
/// [FlightStatScreen]
class FlightStatRoute extends PageRouteInfo<FlightStatRouteArgs> {
  FlightStatRoute({
    Key? key,
    required List<FlightStat> flightStatList,
    int? index,
    List<PageRouteInfo>? children,
  }) : super(
          FlightStatRoute.name,
          args: FlightStatRouteArgs(
            key: key,
            flightStatList: flightStatList,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'FlightStatRoute';

  static const PageInfo<FlightStatRouteArgs> page =
      PageInfo<FlightStatRouteArgs>(name);
}

class FlightStatRouteArgs {
  const FlightStatRouteArgs({
    this.key,
    required this.flightStatList,
    this.index,
  });

  final Key? key;

  final List<FlightStat> flightStatList;

  final int? index;

  @override
  String toString() {
    return 'FlightStatRouteArgs{key: $key, flightStatList: $flightStatList, index: $index}';
  }
}

/// generated route for
/// [FlightsAllScreen]
class FlightsAllRoute extends PageRouteInfo<void> {
  const FlightsAllRoute({List<PageRouteInfo>? children})
      : super(
          FlightsAllRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightsAllRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FlightsScreen]
class FlightsRoute extends PageRouteInfo<void> {
  const FlightsRoute({List<PageRouteInfo>? children})
      : super(
          FlightsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FlightsWrapperScreen]
class FlightsWrapperRoute extends PageRouteInfo<void> {
  const FlightsWrapperRoute({List<PageRouteInfo>? children})
      : super(
          FlightsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightsWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JetlagScreen]
class JetlagRoute extends PageRouteInfo<void> {
  const JetlagRoute({List<PageRouteInfo>? children})
      : super(
          JetlagRoute.name,
          initialChildren: children,
        );

  static const String name = 'JetlagRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewFlightArrivalScreen]
class NewFlightArrivalRoute extends PageRouteInfo<void> {
  const NewFlightArrivalRoute({List<PageRouteInfo>? children})
      : super(
          NewFlightArrivalRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewFlightArrivalRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewFlightTransfersScreen]
class NewFlightTransfersRoute extends PageRouteInfo<void> {
  const NewFlightTransfersRoute({List<PageRouteInfo>? children})
      : super(
          NewFlightTransfersRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewFlightTransfersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewFlightWrapperScreen]
class NewFlightWrapperRoute extends PageRouteInfo<void> {
  const NewFlightWrapperRoute({List<PageRouteInfo>? children})
      : super(
          NewFlightWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewFlightWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PromotionScreen]
class PromotionRoute extends PageRouteInfo<void> {
  const PromotionRoute({List<PageRouteInfo>? children})
      : super(
          PromotionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PromotionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SingleFlightScreen]
class SingleFlightRoute extends PageRouteInfo<SingleFlightRouteArgs> {
  SingleFlightRoute({
    Key? key,
    required int index,
    required bool openPlans,
    List<PageRouteInfo>? children,
  }) : super(
          SingleFlightRoute.name,
          args: SingleFlightRouteArgs(
            key: key,
            index: index,
            openPlans: openPlans,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleFlightRoute';

  static const PageInfo<SingleFlightRouteArgs> page =
      PageInfo<SingleFlightRouteArgs>(name);
}

class SingleFlightRouteArgs {
  const SingleFlightRouteArgs({
    this.key,
    required this.index,
    required this.openPlans,
  });

  final Key? key;

  final int index;

  final bool openPlans;

  @override
  String toString() {
    return 'SingleFlightRouteArgs{key: $key, index: $index, openPlans: $openPlans}';
  }
}

/// generated route for
/// [TabBarWrapperScreen]
class TabBarWrapperRoute extends PageRouteInfo<void> {
  const TabBarWrapperRoute({List<PageRouteInfo>? children})
      : super(
          TabBarWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabBarWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
