import 'package:bloc/bloc.dart';
import 'package:flights/app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsCubit extends Cubit<bool?> {
  NotificationsCubit() : super(null) {
    read();
  }

  read() {
    final notifications = locator<SharedPreferences>().getBool('notifications');
    if (notifications != null) {
      if (notifications) {
        emit(true);
      } else {
        emit(false);
      }
    } else {
      emit(true);
    }
  }

  set(bool value) => locator<SharedPreferences>()
      .setBool('notifications', value)
      .whenComplete(() => read());
}
