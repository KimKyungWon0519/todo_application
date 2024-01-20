import 'package:intl/intl.dart';
import 'package:todo_application/src/features/main/data/data_sources/hive_client.dart';
import 'package:todo_application/src/features/main/data/mappers/todo_mapper.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/repositories/hive_repository.dart';

class HiveRepositoryImpl extends HiveRepository {
  final HiveClient _hiveClient;

  HiveRepositoryImpl({
    required HiveClient hiveClient,
  }) : _hiveClient = hiveClient;

  @override
  Future<void> addTodo(Todo todo) async {
    todo = todo.copyWith(key: _createNewKey());

    return _hiveClient.addTodos(todo.toModel());
  }

  @override
  List<Todo> getTodos() =>
      _hiveClient.getTodos().map((e) => e.toEntity()).toList();

  @override
  Future<void> removeTodo(Todo todo) => _hiveClient.removeTodos(todo.toModel());

  @override
  Future<void> changeTodo(Todo todo) async {
    List<Todo> todos = getTodos();

    int index = todos.indexOf(todo);

    todos[index] = todo;

    await _hiveClient.changeTodos(todos.map((e) => e.toModel()).toList());
  }

  @override
  List<Todo> getAchievedTodos() {
    return getTodos()
        .where((element) => element.achievedDateTime.isNotEmpty)
        .toList();
  }

  @override
  List<Todo> getNotAchievedTodos() {
    return getTodos().where((element) {
      if (element.achievedDateTime.isNotEmpty) return false;

      return DateTime.parse(element.registeredDateTime)
              .difference(DateTime.now())
              .inDays
              .abs() >
          0;
    }).toList();
  }

  @override
  List<Todo> getTodayTodo(DateTime date) {
    return getTodos().where((element) {
      if (element.achievedDateTime.isNotEmpty) return false;

      return DateTime.parse(element.registeredDateTime)
              .difference(date)
              .inDays
              .abs() ==
          0;
    }).toList();
  }

  int _createNewKey() {
    List<Todo> todos = getTodos();

    if (todos.isEmpty) {
      return 0;
    } else {
      todos.sort(
        (a, b) {
          if (a.key < b.key) {
            return -1;
          } else if (a.key == b.key) {
            return 0;
          } else {
            return 1;
          }
        },
      );

      return todos.last.key + 1;
    }
  }
}
