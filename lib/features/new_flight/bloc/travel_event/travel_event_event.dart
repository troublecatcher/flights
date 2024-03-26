abstract class TravelEventEvent {}

class UpdatedCountry extends TravelEventEvent {
  final String country;
  UpdatedCountry(this.country);
}

class UpdatedCity extends TravelEventEvent {
  final String city;
  UpdatedCity(this.city);
}

class UpdatedAirport extends TravelEventEvent {
  final String airport;
  UpdatedAirport(this.airport);
}

class UpdatedDateTime extends TravelEventEvent {
  final DateTime dateTime;
  UpdatedDateTime(this.dateTime);
}

class ClearTravelEvent extends TravelEventEvent {}
