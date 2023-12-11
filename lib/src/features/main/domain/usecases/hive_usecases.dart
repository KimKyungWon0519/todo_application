import 'package:todo_application/src/features/main/domain/entities/todo_model.dart';
import 'package:todo_application/src/features/main/domain/repositories/hive_repository.dart';

class AddTodoUseCase {
  final HiveRepository _hiveRepository;

  const AddTodoUseCase({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  Future<void> addTodo(Todo todo) async {
    await _hiveRepository.addTodos(todo);
  }
}
