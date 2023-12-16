import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_application/src/core/contants/hive_keys.dart';
import 'package:todo_application/src/features/main/data/models/todo_model.dart';

class HiveClient {
  final Box<List<TodoModel>> _box;

  const HiveClient({
    required Box<List<TodoModel>> box,
  }) : _box = box;

  Future<void> addNonStateTodos(TodoModel todo) async {
    List<TodoModel> todos = getNonStateTodos();
    todos.add(todo);

    _box.put(HiveKeys.nonState, todos);
  }

  List<TodoModel> getNonStateTodos() => _box.get(HiveKeys.nonState) ?? [];
}
