import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_application/src/core/contants/todo_hive_keys.dart';
import 'package:todo_application/src/features/main/data/models/todo_model.dart';

class HiveClient {
  final Box<List> _box;

  const HiveClient({
    required Box<List> box,
  }) : _box = box;

  Future<void> addNonStatusTodo(TodoModel todo) =>
      _addTodos(TodoHiveKeys.none, todo);

  Future<void> addAchievedStatusTodo(TodoModel todo) =>
      _addTodos(TodoHiveKeys.achieved, todo);

  List<TodoModel> getNonStatusTodos() => _getTodos(TodoHiveKeys.none);

  List<TodoModel> getAchievedStatusTodos() => _getTodos(TodoHiveKeys.achieved);

  Future<void> _addTodos(String key, TodoModel value) async {
    List<TodoModel> todos = _getTodos(key);
    todos.add(value);

    await _box.put(key, todos);
  }

  List<TodoModel> _getTodos(String key) =>
      _box.get(key)?.map((e) => e as TodoModel).toList() ?? [];
}
