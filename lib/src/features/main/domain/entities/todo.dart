import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    required int key,
    required String title,
    required String registeredDateTime,
    required TodoStatus status,
  }) = _Todo;
}
