import 'package:bloc/bloc.dart';
import 'package:flights/features/flights/flights/model/transfer/transfer.dart';

part 'transfer_event.dart';

class TransferBloc extends Bloc<TransferEvent, Transfer?> {
  TransferBloc() : super(Transfer('', '', '', DateTime.now(), DateTime.now())) {
    on<UpdatedCountry>(
      (event, emit) => emit(state!.copyWith(country: event.country)),
    );
    on<UpdatedCity>(
      (event, emit) => emit(state!.copyWith(city: event.city)),
    );
    on<UpdatedAirport>(
      (event, emit) => emit(state!.copyWith(airport: event.airport)),
    );
    on<UpdatedArrivalDateTime>(
      (event, emit) => emit(state!.copyWith(arrival: event.arrival)),
    );
    on<UpdatedDepartureDateTime>(
      (event, emit) => emit(state!.copyWith(departure: event.departure)),
    );
  }
}
