import 'package:flights/app/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;

Future<void> initNotifications() async {
  const DarwinInitializationSettings initSettings =
      DarwinInitializationSettings();
  const InitializationSettings initializationSettings = InitializationSettings(
    iOS: initSettings,
  );
  await locator<FlutterLocalNotificationsPlugin>()
      .initialize(initializationSettings);

  tz.initializeTimeZones();
}
