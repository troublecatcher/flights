import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flights/app/main.dart';

Future<void> initDI() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  locator.registerLazySingleton<FlutterLocalNotificationsPlugin>(
      () => flutterLocalNotificationsPlugin);

  if (locator<SharedPreferences>().getBool('isFirstTime') == null) {
    isFirstTime = true;
  } else {
    isFirstTime = false;
  }
}
