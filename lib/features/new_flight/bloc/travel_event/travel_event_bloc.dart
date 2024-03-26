import 'package:bloc/bloc.dart';
import 'package:flights/features/flights/flights/model/travel_event/travel_event.dart';
import 'package:flights/features/new_flight/bloc/travel_event/travel_event_event.dart';

class TravelEventBloc extends Bloc<TravelEventEvent, TravelEvent?> {
  TravelEventBloc() : super(TravelEvent('', '', '', DateTime.now())) {
    on<UpdatedCountry>(
      (event, emit) => emit(state!.copyWith(country: event.country)),
    );
    on<UpdatedCity>(
      (event, emit) => emit(state!.copyWith(city: event.city)),
    );
    on<UpdatedAirport>(
      (event, emit) => emit(state!.copyWith(airport: event.airport)),
    );
    on<UpdatedDateTime>(
      (event, emit) => emit(state!.copyWith(dateTime: event.dateTime)),
    );
    on<ClearTravelEvent>(
      (_, emit) => emit(TravelEvent('', '', '', DateTime.now())),
    );
  }
}
