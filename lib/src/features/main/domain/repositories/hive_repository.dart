import 'package:todo_application/src/features/main/domain/entities/todo.dart';

abstract class HiveRepository {
  Future<void> addNonStatusTodos(Todo todo);
  List<Todo> getNonStatusTodos();

  Future<void> addAchievedStatusTodo(Todo todo);
}
