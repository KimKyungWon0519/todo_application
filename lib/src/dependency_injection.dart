import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_application/src/features/main/data/data_sources/hive_client.dart';
import 'package:todo_application/src/features/main/data/models/todo_model.dart';
import 'package:todo_application/src/features/main/data/repositories/hive_repository_impl.dart';
import 'package:todo_application/src/features/main/domain/repositories/hive_repository.dart';

Future initDI() async {
  Box<List<TodoModel>> box = await Hive.openBox('todos');

  /* Start Initialize Data Source */

  HiveClient hiveClient = HiveClient(box: box);

  /* End Initialize Data Source */

  /* Start Initialize Repository */

  HiveRepository hiveRepository = HiveRepositoryImpl(hiveClient: hiveClient);

  /* End Initialize Repository */
}
