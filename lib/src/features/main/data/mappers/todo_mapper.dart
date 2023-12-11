import 'package:todo_application/src/features/main/data/models/todo_model.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_model.dart';

class TodoMapper {
  const TodoMapper._();

  static TodoModel entityToModel(Todo todo) {
    return TodoModel(
      key: todo.key,
      title: todo.title,
      registeredDateTime: todo.registeredDateTime,
    );
  }
}
