import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_application/src/core/contants/todo_hive_keys.dart';
import 'package:todo_application/src/features/main/data/data_sources/hive_client.dart';
import 'package:todo_application/src/features/main/data/models/todo_model.dart';
import 'package:todo_application/src/features/main/data/repositories/hive_repository_impl.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/repositories/hive_repository.dart';
import 'package:todo_application/src/features/main/domain/usecases/hive_usecases.dart';
import 'package:todo_application/src/features/main/presentation/presenter/main/state.dart';
import 'package:todo_application/src/features/main/presentation/presenter/main/viewmodel.dart';
import 'package:todo_application/src/features/main/presentation/presenter/providers.dart';

Future initDI() async {
  Hive.registerAdapter(TodoModelAdapter());
  Box<List> box = await Hive.openBox<List>(TodoHiveKeys.boxName);

  /* Start Initialize Data Source */

  HiveClient hiveClient = HiveClient(box: box);

  /* End Initialize Data Source */

  /* Start Initialize Repository */

  HiveRepository hiveRepository = HiveRepositoryImpl(hiveClient: hiveClient);

  /* End Initialize Repository */

  /* Start Initialize UseCase */

  AddTodoUseCase addTodoUseCase =
      AddTodoUseCase(hiveRepository: hiveRepository);

  GetTodoUseCase getTodoUseCase =
      GetTodoUseCase(hiveRepository: hiveRepository);

  RemoveTodoUseCase removeTodoUseCase =
      RemoveTodoUseCase(hiveRepository: hiveRepository);

  ChangeTodoUseCase changeTodoUseCase =
      ChangeTodoUseCase(hiveRepository: hiveRepository);

  /* End Initialize UseCase */

  /* Start Initialize ViewModel */

  mainProvider =
      StateNotifierProvider<MainViewModel, TodoState>((ref) => MainViewModel(
            addTodoUseCase: addTodoUseCase,
            getTodoUseCase: getTodoUseCase,
            removeTodoUseCase: removeTodoUseCase,
            changeTodoUseCase: changeTodoUseCase,
          ));

  /* End Initialize ViewModel */
}
