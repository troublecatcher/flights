part of 'transfer_bloc.dart';

sealed class TransferEvent {}

final class UpdatedCountry extends TransferEvent {
  final String country;
  UpdatedCountry(this.country);
}

final class UpdatedCity extends TransferEvent {
  final String city;
  UpdatedCity(this.city);
}

final class UpdatedAirport extends TransferEvent {
  final String airport;
  UpdatedAirport(this.airport);
}

final class UpdatedArrivalDateTime extends TransferEvent {
  final DateTime arrival;
  UpdatedArrivalDateTime(this.arrival);
}

final class UpdatedDepartureDateTime extends TransferEvent {
  final DateTime departure;
  UpdatedDepartureDateTime(this.departure);
}
