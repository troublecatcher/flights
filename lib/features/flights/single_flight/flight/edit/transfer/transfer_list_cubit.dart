import 'package:bloc/bloc.dart';
import 'package:flights/features/flights/flights/model/transfer/transfer.dart';

class TransferListCubit extends Cubit<List<Transfer>> {
  TransferListCubit() : super([]);

  init(List<Transfer> transferList) => emit(transferList);

  create(Transfer transfer) => emit([...state, transfer]);
  delete(int index) {
    final newState = state;
    newState.removeAt(index);
    if (newState.isEmpty) {
      flush();
    } else {
      emit(newState);
    }
  }

  flush() => emit([]);
}
