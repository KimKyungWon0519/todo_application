import 'package:hive_flutter/hive_flutter.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  final int key;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String registeredDateTime;
  @HiveField(3)
  final String achievedDateTime;

  const TodoModel({
    required this.key,
    required this.title,
    required this.registeredDateTime,
    required this.achievedDateTime,
  });

  @override
  bool operator ==(covariant TodoModel other) => key == other.key;

  @override
  int get hashCode => key.hashCode;
}
