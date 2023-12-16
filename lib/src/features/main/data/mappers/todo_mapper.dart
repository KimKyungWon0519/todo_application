import 'package:todo_application/src/features/main/data/models/todo_model.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';

extension TodoExtension on Todo {
  TodoModel toModel() {
    return TodoModel(
      key: key,
      title: title,
      registeredDateTime: registeredDateTime,
    );
  }
}

extension TodoModelExtension on TodoModel {
  Todo toEntity(TodoStatus status) {
    return Todo(
      key: key,
      title: title,
      registeredDateTime: registeredDateTime,
      status: status,
    );
  }
}
