import 'package:intl/intl.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';
import 'package:todo_application/src/features/main/domain/usecases/hive_usecases.dart';

class MainViewModel {
  final AddTodoUseCase _addTodoUseCase;
  final GetTodoUseCase _getTodoUseCase;

  const MainViewModel({
    required AddTodoUseCase addTodoUseCase,
    required GetTodoUseCase getTodoUseCase,
  })  : _addTodoUseCase = addTodoUseCase,
        _getTodoUseCase = getTodoUseCase;

  Future<void> addTodo(String title) async {
    Todo todo = Todo(
      key: -1,
      title: title,
      registeredDateTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      status: TodoStatus.none,
    );

    await _addTodoUseCase.addTodo(todo);
  }
}
