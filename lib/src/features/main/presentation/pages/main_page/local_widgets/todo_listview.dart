import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/presentation/presenter/providers.dart';

import 'todo_tile.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(mainProvider);

    return ListView.builder(
      itemBuilder: (context, index) {
        return TodoTile(todo: todos[index]);
      },
      itemCount: todos.length,
    );
  }
}
