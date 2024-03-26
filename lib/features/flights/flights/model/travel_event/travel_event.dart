import 'package:hive/hive.dart';

part 'travel_event.g.dart';

@HiveType(typeId: 0)
class TravelEvent {
  @HiveField(0)
  final String country;

  @HiveField(1)
  final String city;

  @HiveField(2)
  final String airport;

  @HiveField(3)
  final DateTime dateTime;

  TravelEvent(
    this.country,
    this.city,
    this.airport,
    this.dateTime,
  );

  TravelEvent copyWith({
    String? country,
    String? city,
    String? airport,
    DateTime? dateTime,
  }) {
    return TravelEvent(
      country ?? this.country,
      city ?? this.city,
      airport ?? this.airport,
      dateTime ?? this.dateTime,
    );
  }
}
