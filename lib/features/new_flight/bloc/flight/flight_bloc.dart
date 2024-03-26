import 'package:bloc/bloc.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event.dart';
import 'package:flights/features/new_flight/bloc/flight/flight_event.dart';

class FlightBloc extends Bloc<TransferEvent, Flight?> {
  FlightBloc()
      : super(
            Flight(departure: null, arrival: null, transfers: [], plans: [])) {
    on<UpdatedDeparture>(
      (event, emit) => emit(state!.copyWith(
          departure: TravelEvent(
        event.departure.country,
        event.departure.city,
        event.departure.airport,
        event.departure.dateTime,
      ))),
    );
    on<UpdatedArrival>(
      (event, emit) => emit(state!.copyWith(
          arrival: TravelEvent(
        event.arrival.country,
        event.arrival.city,
        event.arrival.airport,
        event.arrival.dateTime,
      ))),
    );
    on<AddedTransfer>(
      (event, emit) => emit(
        state!.copyWith(transfers: [...state!.transfers, event.transfer]),
      ),
    );
    on<RemovedTransfer>((event, emit) {
      final newState = state!.transfers;
      newState.removeAt(event.index);
      emit(state!.copyWith(transfers: newState));
    });
    on<ClearTransfers>(
      (_, emit) => emit(state!.copyWith(transfers: [])),
    );
  }
}
