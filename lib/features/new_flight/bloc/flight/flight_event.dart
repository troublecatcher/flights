import 'package:flights/features/flights/flights/model/travel_event/travel_event.dart';
import 'package:flights/features/flights/flights/model/transfer/transfer.dart';

abstract class TransferEvent {}

class UpdatedDeparture extends TransferEvent {
  final TravelEvent departure;
  UpdatedDeparture(this.departure);
}

class UpdatedArrival extends TransferEvent {
  final TravelEvent arrival;
  UpdatedArrival(this.arrival);
}

class AddedTransfer extends TransferEvent {
  final Transfer transfer;
  AddedTransfer(this.transfer);
}

class RemovedTransfer extends TransferEvent {
  final int index;
  RemovedTransfer(this.index);
}

class ClearTransfers extends TransferEvent {}
