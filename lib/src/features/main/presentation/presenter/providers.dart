import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/src/features/main/presentation/presenter/main/state.dart';
import 'package:todo_application/src/features/main/presentation/presenter/main/viewmodel.dart';

late final StateNotifierProvider<MainViewModel, TodoState> mainProvider;
