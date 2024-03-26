import 'package:auto_route/auto_route.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flights/controller/flight_list_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/flights/view/widgets/flight_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class FlightsAllScreen extends StatelessWidget {
  const FlightsAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          border: null,
          backgroundColor: surfaceColor,
          previousPageTitle: 'Flights',
          middle: Text('All flights'),
        ),
        child: SafeArea(
          child: BlocBuilder<FlightListCubit, List<Flight>>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SizedBox(height: 8.h);
                    } else {
                      if (index <= state.length) {
                        return FlightCard(
                          flight: state[index - 1],
                          index: index - 1,
                          openFlans: false,
                        );
                      } else {
                        return SizedBox(height: 16.h);
                      }
                    }
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  itemCount: state.length + 2,
                ),
              );
            },
          ),
        ));
  }
}
