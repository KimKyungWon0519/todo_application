import 'package:todo_application/src/features/main/domain/entities/todo.dart';

abstract class HiveRepository {
  Future<void> addNonStatusTodo(Todo todo);
  List<Todo> getNonStatusTodos();
  Future<void> removeNonStatusTodo(Todo todo);

  Future<void> addAchievedStatusTodo(Todo todo);
  List<Todo> getAchievedStatusTodos();
}
