import 'package:auto_route/auto_route.dart';
import 'package:flights/app/main.dart';
import 'package:flights/app/router/tabs_router.dart';
import 'package:flights/features/flights/flight_stat/model/flight_stat.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/flights/model/plan/plan.dart';
import 'package:flights/features/flights/flights/view/layout/flights_all_screen.dart';
import 'package:flights/features/flights/flights/view/layout/flights_screen.dart';
import 'package:flights/features/flights/flights/view/layout/flights_wrapper_screen.dart';
import 'package:flights/features/flights/flight_stat/layout/flight_stat_screen.dart';
import 'package:flights/features/flights/jetlag/jetlag_screen.dart';
import 'package:flights/features/flights/single_flight/flight/edit/edit_arrival_screen.dart';
import 'package:flights/features/flights/single_flight/flight/edit/edit_departure_screen.dart';
import 'package:flights/features/flights/single_flight/flight/edit/transfer/edit_transfer_add_screen.dart';
import 'package:flights/features/flights/single_flight/flight/edit/transfer/edit_transfers_screen.dart';
import 'package:flights/features/flights/single_flight/flight/edit/transfer/transfer_list_cubit.dart';
import 'package:flights/features/flights/single_flight/flight/view/single_flight_screen.dart';
import 'package:flights/features/flights/single_flight/plans/add_plans_screen.dart';
import 'package:flights/features/new_flight/3_transfers/add_transfer_screen.dart';
import 'package:flights/features/new_flight/2_arrival/arrival_screen.dart';
import 'package:flights/features/new_flight/1_departure/departure_screen.dart';
import 'package:flights/features/new_flight/3_transfers/transfers_screen.dart';
import 'package:flights/features/new_flight/1_departure/new_flight_wrapper_screen.dart';
import 'package:flights/features/onboarding/onboarding_screen.dart';
import 'package:flights/features/settings/view/privacy_policy_screen.dart';
import 'package:flights/features/settings/view/promotion_screen.dart';
import 'package:flights/features/settings/view/settings_screen.dart';
import 'package:flights/features/settings/view/terms_of_use_screen.dart';
import 'package:flutter/cupertino.dart';

part 'router.gr.dart';

final showPromotion = promotion != null && promotion != '';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsOfUseRoute.page),
        AutoRoute(
          page: PromotionRoute.page,
          initial: showPromotion,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          initial: isFirstTime! && !showPromotion,
        ),
        AutoRoute(
            page: TabBarWrapperRoute.page,
            initial: !isFirstTime! && !showPromotion,
            children: [
              AutoRoute(
                page: FlightsWrapperRoute.page,
                children: [
                  AutoRoute(page: FlightsRoute.page),
                  AutoRoute(page: JetlagRoute.page),
                  AutoRoute(page: FlightStatRoute.page),
                  AutoRoute(page: FlightsAllRoute.page),
                  AutoRoute(page: SingleFlightRoute.page),
                  AutoRoute(page: AddPlansRoute.page),
                  AutoRoute(page: EditDepartureRoute.page),
                  AutoRoute(page: EditArrivalRoute.page),
                  AutoRoute(page: EditTransferRoute.page),
                  AutoRoute(page: EditTransferAddRoute.page),
                ],
              ),
              AutoRoute(
                page: NewFlightWrapperRoute.page,
                children: [
                  AutoRoute(
                    page: DepartureRoute.page,
                  ),
                  AutoRoute(page: NewFlightArrivalRoute.page),
                  AutoRoute(page: NewFlightTransfersRoute.page),
                  AutoRoute(page: AddTransferRoute.page),
                ],
              ),
              AutoRoute(page: SettingsRoute.page),
            ]),
      ];
}
