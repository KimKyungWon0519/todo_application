import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';
import 'package:todo_application/src/features/main/domain/usecases/hive_usecases.dart';

class MainViewModel extends StateNotifier<List<Todo>> {
  final AddTodoUseCase _addTodoUseCase;
  final GetTodoUseCase _getTodoUseCase;

  MainViewModel({
    required AddTodoUseCase addTodoUseCase,
    required GetTodoUseCase getTodoUseCase,
  })  : _addTodoUseCase = addTodoUseCase,
        _getTodoUseCase = getTodoUseCase,
        super([]) {
    _updateTodos();
  }

  Future<void> addTodo(String title) async {
    Todo todo = Todo(
      key: -1,
      title: title,
      registeredDateTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      status: TodoStatus.none,
    );

    await _addTodoUseCase
        .addNonStatusTodo(todo)
        .then((value) => _updateTodos());
  }

  Future<void> achieveTodo(Todo todo) async {
    await _addTodoUseCase
        .addAchievedStatusTodo(todo)
        .then((value) => _updateTodos());
  }

  void _updateTodos() {
    List<Todo> todos = _getTodoUseCase.getNonStatusTodo();

    state = todos;
  }
}
