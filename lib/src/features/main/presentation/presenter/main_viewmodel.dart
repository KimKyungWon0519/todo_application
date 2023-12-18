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
    _initializeTodos();
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

  int getRemainingDateTime(String registeredDateTime) {
    DateTime dateTime = DateTime.parse(registeredDateTime);
    return 7 - dateTime.difference(DateTime.now()).inDays.abs();
  }

  void _initializeTodos() async {
    await _addNotAchievedTodo();
    await _deleteAchievedTodoAfter7Days();

    _updateTodos();
  }

  Future<void> _deleteAchievedTodoAfter7Days() async {
    List<Todo> todos = _getTodoUseCase.getAchievedStatusTodos();

    for (Todo todo in todos) {
      if (getRemainingDateTime(todo.registeredDateTime) == 0) {
        await _removeTodoUseCase.removeAchievedStatusTodo(todo);
      }
    }
  }

  Future<void> _addNotAchievedTodo() async {
    List<Todo> todos = _getTodoUseCase.getNonStatusTodo();
    List<Todo> notAchievedTodos = _getTodoUseCase.getNotAchievedStatusTodos();

    for (Todo todo in todos) {
      DateTime dateTime = DateTime.parse(todo.registeredDateTime);

      if (!notAchievedTodos.contains(todo) &&
          dateTime.difference(DateTime.now()).inDays.abs() > 0) {
        await _addTodoUseCase
            .addNotAchievedStatusTodo(todo)
            .then((value) async {
          await _removeTodoUseCase.removeNonStatusTodo(todo);
        });
      }
    }
  }

  void _updateTodos() {
    List<Todo> nonStatusTodos = _getTodoUseCase.getNonStatusTodo();
    List<Todo> achievedStatusTodos = _getTodoUseCase.getAchievedStatusTodos();
    List<Todo> notAchievedStatusTodos =
        _getTodoUseCase.getNotAchievedStatusTodos();

    List<Todo> todos = [
      ...nonStatusTodos,
      ...notAchievedStatusTodos,
      ...achievedStatusTodos,
    ];

    state = todos;
  }
}
