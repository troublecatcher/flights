import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flights/app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

part 'jetlag_state.dart';

class JetlagCubit extends Cubit<JetlagState> {
  late Timer timer;
  JetlagCubit() : super(JetlagInitial()) {
    read();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      read();
    });
  }

  read() {
    final jetlag = locator<SharedPreferences>().getString('jetlag');
    if (jetlag != null) {
      if (DateTime.parse(jetlag).isBefore(DateTime.now()) ||
          DateTime.parse(jetlag).isAtSameMomentAs(DateTime.now())) {
        emit(JetlagUnset());
      } else {
        emit(JetlagSet(DateTime.parse(jetlag)));
      }
    } else {
      emit(JetlagUnset());
    }
  }

  create(DateTime dateTime) async {
    locator<SharedPreferences>()
        .setString('jetlag', dateTime.toIso8601String())
        .whenComplete(() => read());
    await locator<FlutterLocalNotificationsPlugin>().zonedSchedule(
      0,
      'Time to get up!',
      'Wakey-wakey ✈️',
      tz.TZDateTime.from(dateTime, tz.local),
      const NotificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  delete() async {
    await locator<FlutterLocalNotificationsPlugin>().cancel(0);
    locator<SharedPreferences>().remove('jetlag').whenComplete(() => read());
  }
}
