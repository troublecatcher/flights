part of 'jetlag_cubit.dart';

@immutable
sealed class JetlagState {}

final class JetlagInitial extends JetlagState {}

final class JetlagSet extends JetlagState {
  final DateTime dateTime;

  JetlagSet(this.dateTime);
}

final class JetlagUnset extends JetlagState {}
