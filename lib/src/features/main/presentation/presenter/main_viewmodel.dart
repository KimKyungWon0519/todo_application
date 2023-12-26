import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';
import 'package:todo_application/src/features/main/domain/usecases/hive_usecases.dart';

class MainViewModel extends StateNotifier<List<Todo>> {
  final AddTodoUseCase _addTodoUseCase;
  final GetTodoUseCase _getTodoUseCase;
  final RemoveTodoUseCase _removeTodoUseCase;
  final ChangeTodoUseCase _changeTodoUseCase;

  MainViewModel({
    required AddTodoUseCase addTodoUseCase,
    required GetTodoUseCase getTodoUseCase,
    required RemoveTodoUseCase removeTodoUseCase,
    required ChangeTodoUseCase changeTodoUseCase,
  })  : _addTodoUseCase = addTodoUseCase,
        _getTodoUseCase = getTodoUseCase,
        _removeTodoUseCase = removeTodoUseCase,
        _changeTodoUseCase = changeTodoUseCase,
        super([]) {
    _initializeTodos();
  }

  Future<void> addTodo(String title) async {
    Todo todo = Todo(
      key: -1,
      title: title,
      registeredDateTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );

    await _addTodoUseCase.addTodo(todo).then((value) => _updateTodos());
  }

  Future<void> achieveTodo(Todo todo) async {
    await _changeTodoUseCase
        .changeTodo(
          todo.copyWith(
            achievedDateTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          ),
        )
        .then((value) => _updateTodos());
  }

  TodoStatus getTodoStatus(Todo todo) {
    if (todo.achievedDateTime.isNotEmpty) {
      return TodoStatus.achieved;
    }

    DateTime dateTime = DateTime.parse(todo.registeredDateTime);

    if (dateTime.difference(DateTime.now()).inDays != 0) {
      return TodoStatus.notAchieved;
    }

    return TodoStatus.none;
  }

  Future<void> unachieveTodo(Todo todo) async {
    await _changeTodoUseCase
        .changeTodo(todo.copyWith(achievedDateTime: ''))
        .then((value) => _updateTodos());
  }

  int getRemainingDateTime(String registeredDateTime) {
    DateTime dateTime = DateTime.parse(registeredDateTime);
    return 7 - dateTime.difference(DateTime.now()).inDays.abs();
  }

  void _initializeTodos() async {
    await _deleteAchievedTodoAfter7Days();

    _updateTodos();
  }

  Future<void> _deleteAchievedTodoAfter7Days() async {
    List<Todo> todos = _getTodoUseCase.getAchievedTodos();

    for (Todo todo in todos) {
      if (getRemainingDateTime(todo.achievedDateTime) == 0) {
        await _removeTodoUseCase.removeTodo(todo);
      }
    }
  }

  void _updateTodos() {
    state = _getTodoUseCase.getTodos();
  }
}
