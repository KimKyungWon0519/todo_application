import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';
import 'package:todo_application/src/features/main/domain/usecases/hive_usecases.dart';

class MainViewModel extends StateNotifier<List<Todo>> {
  final AddTodoUseCase _addTodoUseCase;
  final GetTodoUseCase _getTodoUseCase;
  final RemoveTodoUseCase _removeTodoUseCase;

  MainViewModel({
    required AddTodoUseCase addTodoUseCase,
    required GetTodoUseCase getTodoUseCase,
    required RemoveTodoUseCase removeTodoUseCase,
  })  : _addTodoUseCase = addTodoUseCase,
        _getTodoUseCase = getTodoUseCase,
        _removeTodoUseCase = removeTodoUseCase,
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
    await _addTodoUseCase.addAchievedStatusTodo(todo).then((value) async {
      await _removeTodoUseCase.removeNonStatusTodo(todo);

      _updateTodos();
    });
  }

  Future<void> unachieveTodo(Todo todo) async {
    await _addTodoUseCase.addNonStatusTodo(todo).then((value) async {
      await _removeTodoUseCase.removeAchievedStatusTodo(todo);

      _updateTodos();
    });
  }

  void _updateTodos() {
    List<Todo> nonStatusTodo = _getTodoUseCase.getNonStatusTodo();
    List<Todo> achieveStatusTodo = _getTodoUseCase.getAchievedStatusTodos();

    List<Todo> todos = [...nonStatusTodo, ...achieveStatusTodo];

    state = todos;
  }
}
