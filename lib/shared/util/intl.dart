import 'package:intl/intl.dart';

final timeFormatter = DateFormat('HH:mm');
final dateFormatter = DateFormat('dd.MM.yyyy');

String formatDuration(Duration duration) {
  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);

  String hoursString = hours.toString().padLeft(2, '0');
  String minutesString = minutes.toString().padLeft(2, '0');

  return '$hoursString:$minutesString';
}

String plans(int howMany) => Intl.message(
      Intl.plural(
        howMany,
        one: '$howMany Plan',
        other: '$howMany Plans',
      ),
    );

String countries(int howMany) => Intl.message(
      Intl.plural(
        howMany,
        one: '$howMany country',
        other: '$howMany countries',
      ),
    );

String hours(int howMany) => Intl.message(
      Intl.plural(
        howMany,
        one: '$howMany hour',
        other: '$howMany hours',
      ),
    );
