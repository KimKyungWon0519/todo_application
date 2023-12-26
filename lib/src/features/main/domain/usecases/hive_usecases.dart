import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/repositories/hive_repository.dart';

class AddTodoUseCase {
  final HiveRepository _hiveRepository;

  const AddTodoUseCase({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  Future<void> addTodo(Todo todo) => _hiveRepository.addTodo(todo);
}

class GetTodoUseCase {
  final HiveRepository _hiveRepository;

  const GetTodoUseCase({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  List<Todo> getTodos() => _hiveRepository.getTodos();
  List<Todo> getAchievedTodos() => _hiveRepository.getAchievedTodos();
  List<Todo> getNotAchievedTodos() => _hiveRepository.getNotAchievedTodos();
}

class RemoveTodoUseCase {
  final HiveRepository _hiveRepository;

  const RemoveTodoUseCase({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  Future<void> removeTodo(Todo todo) => _hiveRepository.removeTodo(todo);
}

class ChangeTodoUseCase {
  final HiveRepository _hiveRepository;

  const ChangeTodoUseCase({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  Future<void> changeTodo(Todo todo) => _hiveRepository.changeTodo(todo);
}
