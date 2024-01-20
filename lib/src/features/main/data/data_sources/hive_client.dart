import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_application/src/core/contants/todo_hive_keys.dart';
import 'package:todo_application/src/features/main/data/models/todo_model.dart';

class HiveClient {
  final Box<List> _box;

  const HiveClient({
    required Box<List> box,
  }) : _box = box;

  Future<void> addTodos(TodoModel value) async {
    List<TodoModel> todos = getTodos();
    todos.add(value);

    await _box.put(TodoHiveKeys.registered, todos);
  }

  List<TodoModel> getTodos() =>
      _box.get(TodoHiveKeys.registered)?.map((e) => e as TodoModel).toList() ??
      [];

  Future<void> removeTodos(TodoModel value) async {
    List<TodoModel> todos = getTodos();
    todos.remove(value);

    await _box.put(TodoHiveKeys.registered, todos);
  }

  Future<void> changeTodos(List<TodoModel> values) async {
    await _box.put(TodoHiveKeys.registered, values);
  }
}
