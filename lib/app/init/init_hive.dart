import 'package:flights/app/main.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event.dart';
import 'package:flights/features/flights/flights/model/plan/plan.dart';
import 'package:flights/features/flights/flights/model/transfer/transfer.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PlanAdapter());
  Hive.registerAdapter(TravelEventAdapter());
  Hive.registerAdapter(TransferAdapter());
  Hive.registerAdapter(FlightAdapter());
  flightsBox = await Hive.openBox('flights');
}
