import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/repositories/hive_repository.dart';

class AddTodoUseCase {
  final HiveRepository _hiveRepository;

  const AddTodoUseCase({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  Future<void> addNonStatusTodo(Todo todo) =>
      _hiveRepository.addNonStatusTodo(todo);

  Future<void> addAchievedStatusTodo(Todo todo) =>
      _hiveRepository.addAchievedStatusTodo(todo);

  Future<void> addNotAchievedStatusTodo(Todo todo) =>
      _hiveRepository.addNotAchievedStatusTodo(todo);
}

class GetTodoUseCase {
  final HiveRepository _hiveRepository;

  const GetTodoUseCase({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  List<Todo> getNonStatusTodo() => _hiveRepository.getNonStatusTodos();

  List<Todo> getAchievedStatusTodos() =>
      _hiveRepository.getAchievedStatusTodos();

  List<Todo> getNotAchievedStatusTodos() =>
      _hiveRepository.getNotAchievedStatusTodos();
}

class RemoveTodoUseCase {
  final HiveRepository _hiveRepository;

  const RemoveTodoUseCase({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  Future<void> removeNonStatusTodo(Todo todo) =>
      _hiveRepository.removeNonStatusTodo(todo);

  Future<void> removeAchievedStatusTodo(Todo todo) =>
      _hiveRepository.removeAchievedStatusTodo(todo);
}
