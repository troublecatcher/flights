import 'package:flights/features/flights/flights/model/travel_event/travel_event.dart';
import 'package:flights/features/flights/flights/model/plan/plan.dart';
import 'package:flights/features/flights/flights/model/transfer/transfer.dart';
import 'package:hive/hive.dart';

part 'flight.g.dart';

@HiveType(typeId: 2)
class Flight {
  @HiveField(0)
  final TravelEvent? departure;

  @HiveField(1)
  final TravelEvent? arrival;

  @HiveField(2)
  final List<Transfer> transfers;

  @HiveField(3)
  final List<Plan>? plans;

  Flight({
    required this.departure,
    required this.arrival,
    required this.transfers,
    required this.plans,
  });

  Flight copyWith({
    TravelEvent? departure,
    TravelEvent? arrival,
    List<Transfer>? transfers,
    List<Plan>? plans,
  }) {
    return Flight(
      departure: departure ?? this.departure,
      arrival: arrival ?? this.arrival,
      transfers: transfers ?? this.transfers,
      plans: plans ?? this.plans,
    );
  }
}
