import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/features/flights/flights/controller/flight_list_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/single_flight/widgets/plan_card.dart';
import 'package:flights/shared/layout/information_box.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/layout/section_with_title_and_button.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleFlightPlansPage extends StatelessWidget {
  final Flight flight;

  const SingleFlightPlansPage({
    super.key,
    required this.flight,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightListCubit, List<Flight>>(
      builder: (context, state) {
        final plans = state[state.indexOf(flight)].plans;
        if (plans!.isNotEmpty) {
          return SingleChildScrollView(
            child: SectionWithTitleAndButton(
              title: 'Your plans for free time',
              buttonTitle: 'Add plan',
              onPressed: () =>
                  context.router.push(AddPlansRoute(flight: flight)),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => context.router
                      .push(AddPlansRoute(flight: flight, plan: plans[index])),
                  child: PlanCard(plan: plans[index]),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: plans.length,
              ),
            ),
          );
        } else {
          return SectionWithTitle(
            title: 'Your plans for free time',
            child: InformationBox(
              title: 'Add plans for free time',
              subtitle:
                  'It seems that the transfer time is very long, add plans for this period.',
              assetPath: 'assets/icons/notes/note.svg',
              button: CustomButton(
                title: 'Add plans',
                onPressed: () => context.router.push(AddPlansRoute(
                  flight: flight,
                )),
                isActive: true,
              ),
            ),
          );
        }
      },
    );
  }
}
