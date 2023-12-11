import 'package:todo_application/src/features/main/domain/entities/todo.dart';

abstract class HiveRepository {
  Future<void> addTodo(Todo todo);
}
