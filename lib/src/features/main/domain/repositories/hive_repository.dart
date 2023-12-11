import 'package:todo_application/src/features/main/domain/entities/todo_model.dart';

abstract class HiveRepository {
  Future<void> addTodos(Todo todo);
}
