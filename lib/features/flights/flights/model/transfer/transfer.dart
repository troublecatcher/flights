import 'package:hive/hive.dart';

part 'transfer.g.dart';

@HiveType(typeId: 1)
class Transfer {
  @HiveField(0)
  final String country;

  @HiveField(1)
  final String city;

  @HiveField(2)
  final String airport;

  @HiveField(3)
  final DateTime arrival;

  @HiveField(4)
  final DateTime departure;

  Transfer(
    this.country,
    this.city,
    this.airport,
    this.arrival,
    this.departure,
  );

  Transfer copyWith({
    String? country,
    String? city,
    String? airport,
    DateTime? arrival,
    DateTime? departure,
  }) {
    return Transfer(
      country ?? this.country,
      city ?? this.city,
      airport ?? this.airport,
      arrival ?? this.arrival,
      departure ?? this.departure,
    );
  }
}
