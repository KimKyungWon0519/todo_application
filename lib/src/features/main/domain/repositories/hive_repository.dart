import 'package:todo_application/src/features/main/domain/entities/todo.dart';

abstract class HiveRepository {
  Future<void> addNonStateTodos(Todo todo);
  List<Todo> getNonStateTodos();
}
