enum TravelEventType {
  Departure('assets/icons/airplane/airplane_takeoff.svg'),
  Arrival('assets/icons/airplane/airplane_landing.svg');

  final String assetPath;

  const TravelEventType(this.assetPath);
}
