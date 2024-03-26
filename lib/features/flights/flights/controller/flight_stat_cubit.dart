import 'package:bloc/bloc.dart';
import 'package:flights/features/flights/flight_stat/model/flight_stat.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/shared/util/intl.dart';

class FlightStatCubit extends Cubit<List<FlightStat>> {
  FlightStatCubit() : super([]);

  update(List<Flight> flightsList) {
    List<FlightStat> list = [];
    list.add(calculateVisitedCountries(flightsList));
    list.add(calculateSpentInFlight(flightsList));
    list.add(calculateLargestFlight(flightsList));
    emit(list);
  }

  FlightStat calculateVisitedCountries(List<Flight> flightsList) {
    final countriesList = [];
    Map<String, dynamic> data = {};

    if (flightsList.isNotEmpty) {
      for (var flight in flightsList) {
        if (!countriesList.contains(flight.arrival!.country)) {
          countriesList.add(flight.arrival!.country);
        }
        if (!countriesList.contains(flight.departure!.country)) {
          countriesList.add(flight.departure!.country);
        }
      }
      for (var i = 0; i < countriesList.length; i++) {
        data[countriesList[i]] = '';
      }
    }
    return FlightStat(
      assetPath: 'assets/icons/airplane/airplane_marker.svg',
      listAssetPath: 'assets/icons/booking/earth.svg',
      title: 'Visited countries',
      data: data,
      summary: countries(countriesList.length),
    );
  }

  FlightStat calculateSpentInFlight(List<Flight> flightsList) {
    Duration summary = const Duration(milliseconds: 0);
    Map<String, dynamic> data = {};

    if (flightsList.isNotEmpty) {
      for (var flight in flightsList) {
        final duration =
            flight.arrival!.dateTime.difference(flight.departure!.dateTime);
        data['${flight.departure!.country} - ${flight.arrival!.country}'] =
            hours(duration.inHours);
        summary +=
            flight.arrival!.dateTime.difference(flight.departure!.dateTime);
      }
    }
    return FlightStat(
      assetPath: 'assets/icons/booking/clock.svg',
      listAssetPath: 'assets/icons/airplane/airplane.svg',
      title: 'Spent in flight',
      data: data,
      summary: hours(summary.inHours),
    );
  }

  FlightStat calculateLargestFlight(List<Flight> flightsList) {
    Duration maxDuration = Duration.zero;
    Map<String, dynamic> data = {};

    if (flightsList.isNotEmpty) {
      maxDuration = flightsList[0]
          .arrival!
          .dateTime
          .difference(flightsList[0].departure!.dateTime);
      for (var flight in flightsList) {
        final duration =
            flight.arrival!.dateTime.difference(flight.departure!.dateTime);
        data['${flight.departure!.country} - ${flight.arrival!.country}'] =
            hours(duration.inHours);
        if (duration > maxDuration) {
          maxDuration = duration;
        }
      }
      data = Map.fromEntries(data.entries.toList()
        ..sort((e1, e2) => e2.value.compareTo(e1.value)));
    }
    return FlightStat(
      assetPath: 'assets/icons/airplane/airplane_clock.svg',
      listAssetPath: 'assets/icons/airplane/airplane.svg',
      title: 'The largest flight took',
      data: data,
      summary: hours(maxDuration.inHours),
    );
  }
}
