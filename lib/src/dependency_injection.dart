import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_application/src/features/main/data/data_sources/hive_client.dart';
import 'package:todo_application/src/features/main/data/models/todo_model.dart';

Future initDI() async {
  Box<List<TodoModel>> box = await Hive.openBox('todos');

  HiveClient hiveClient = HiveClient(box: box);
}
