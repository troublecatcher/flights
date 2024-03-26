import 'package:flights/app/init/init_hive.dart';
import 'package:flights/app/init/init_notifications.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/app/styling/theme.dart';
import 'package:flights/features/flights/flights/controller/flight_stat_cubit.dart';
import 'package:flights/features/flights/flights/controller/flight_list_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/jetlag/cubit/jetlag_cubit.dart';
import 'package:flights/features/settings/controller/notifications_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:flights/app/init/init_di.dart';
import 'package:flights/app/init/init_firebase.dart';
import 'package:hive/hive.dart';

bool? isFirstTime;
String? privacyPolicy;
String? termsOfUse;
String? promotion;

final locator = GetIt.instance;

Box<Flight>? flightsBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await initDI();
  await initHive();
  await initNotifications();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => NotificationsCubit(),
      ),
      BlocProvider(
        create: (context) => JetlagCubit(),
      ),
      BlocProvider(
        create: (context) => FlightStatCubit(),
      ),
      BlocProvider(
        create: (context) => FlightListCubit(context.read<FlightStatCubit>()),
      ),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return CupertinoApp.router(
          theme: theme,
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [DefaultMaterialLocalizations.delegate],
        );
      },
    );
  }
}
