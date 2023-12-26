import 'package:todo_application/src/features/main/domain/entities/todo.dart';

abstract class HiveRepository {
  Future<void> addTodo(Todo todo);
  List<Todo> getTodos();
  List<Todo> getAchievedTodos();
  List<Todo> getNotAchievedTodos();
  Future<void> removeTodo(Todo todo);
  Future<void> changeTodo(Todo todo);
}
