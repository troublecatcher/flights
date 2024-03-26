import 'package:bloc/bloc.dart';
import 'package:flights/app/main.dart';
import 'package:flights/features/flights/flights/controller/flight_stat_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';

class FlightListCubit extends Cubit<List<Flight>> {
  final FlightStatCubit statCubit;
  FlightListCubit(this.statCubit) : super([]) {
    read();
  }

  create(Flight flight) {
    flightsBox!.add(flight).whenComplete(() => read());
  }

  read() {
    List<Flight> flightsList = [];
    if (flightsBox!.isNotEmpty) {
      for (var i = 0; i < flightsBox!.length; i++) {
        final flight = flightsBox!.getAt(i);
        flightsList.add(flight!);
      }
      emit(flightsList);
    } else {
      emit([]);
    }
    statCubit.update(flightsList);
  }

  update(int index, Flight flight) {
    flightsBox!.putAt(index, flight);
    read();
  }

  delete(int index) {
    flightsBox!.deleteAt(index);
    read();
  }
}
