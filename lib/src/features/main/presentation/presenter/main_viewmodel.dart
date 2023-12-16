import 'package:intl/intl.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';
import 'package:todo_application/src/features/main/domain/usecases/hive_usecases.dart';

class MainViewModel {
  final AddTodoUseCase _addTodoUseCase;

  const MainViewModel({
    required AddTodoUseCase addTodoUseCase,
  }) : _addTodoUseCase = addTodoUseCase;

  Future<void> addTodo(String title) async {
    Todo todo = Todo(
      key: -1,
      title: title,
      registeredDateTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      status: TodoStatus.nonState,
    );

    await _addTodoUseCase.addTodo(todo);
  }
}
