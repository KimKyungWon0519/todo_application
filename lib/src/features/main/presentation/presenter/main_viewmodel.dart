import 'package:intl/intl.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_model.dart';
import 'package:todo_application/src/features/main/domain/repositories/hive_repository.dart';

class MainViewModel {
  final HiveRepository _hiveRepository;

  const MainViewModel({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  Future<void> addTodo(String title) async {
    Todo todo = Todo(
      key: -1,
      title: title,
      registeredDateTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );

    await _hiveRepository.addTodos(todo);
  }
}
