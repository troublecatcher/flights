import 'package:hive/hive.dart';

part 'plan.g.dart';

@HiveType(typeId: 3)
class Plan {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  Plan({
    required this.title,
    required this.description,
  });

  Plan copyWith({
    required String title,
    required String description,
  }) {
    return Plan(
      title: this.title,
      description: this.description,
    );
  }
}
