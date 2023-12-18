import 'package:todo_application/src/features/main/data/data_sources/hive_client.dart';
import 'package:todo_application/src/features/main/data/mappers/todo_mapper.dart';
import 'package:todo_application/src/features/main/data/models/todo_model.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';
import 'package:todo_application/src/features/main/domain/repositories/hive_repository.dart';

class HiveRepositoryImpl extends HiveRepository {
  final HiveClient _hiveClient;

  HiveRepositoryImpl({
    required HiveClient hiveClient,
  }) : _hiveClient = hiveClient;

  @override
  Future<void> addNonStatusTodo(Todo todo) async {
    todo = _updateTodoKey(todo);

    await _hiveClient.addNonStatusTodo(todo.toModel());
  }

  Todo _updateTodoKey(Todo todo) {
    List<TodoModel> todos = _hiveClient.getNonStatusTodos();
    int maxKey = -1;

    for (TodoModel todo in todos) {
      if (maxKey < todo.key) maxKey = todo.key;
    }

    return todo.copyWith(key: maxKey + 1);
  }

  @override
  List<Todo> getNonStatusTodos() {
    return _hiveClient
        .getNonStatusTodos()
        .map((e) => e.toEntity(TodoStatus.none))
        .toList();
  }

  @override
  Future<void> addAchievedStatusTodo(Todo todo) async {
    await _hiveClient.addAchievedStatusTodo(todo.toModel());
  }

  @override
  List<Todo> getAchievedStatusTodos() {
    return _hiveClient
        .getAchievedStatusTodos()
        .map((e) => e.toEntity(TodoStatus.achieved))
        .toList();
  }
}
