import 'package:auto_route/auto_route.dart';
import 'package:flights/features/new_flight/bloc/flight/flight_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NewFlightWrapperScreen extends StatelessWidget {
  const NewFlightWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FlightBloc(),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
