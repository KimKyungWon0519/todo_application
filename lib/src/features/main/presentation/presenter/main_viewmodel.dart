import 'package:todo_application/src/features/main/domain/repositories/hive_repository.dart';

class MainViewModel {
  final HiveRepository _hiveRepository;

  const MainViewModel({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;
}
