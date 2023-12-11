import 'package:hive_flutter/hive_flutter.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  final int key;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final bool isComplete;
  @HiveField(3)
  final String registeredDateTime;

  const TodoModel({
    required this.key,
    required this.title,
    required this.isComplete,
    required this.registeredDateTime,
  });
}
