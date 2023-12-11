import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/src/features/main/presentation/pages/main_page/local_widgets/add_dialog.dart';
import 'package:todo_application/src/features/main/presentation/presenter/providers.dart';

class AddTodoFAB extends ConsumerWidget {
  const AddTodoFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => _onPressed(context, ref),
      child: const Icon(Icons.add),
    );
  }

  void _onPressed(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => const AddDialog(),
    ).then((value) {
      if (value != null) {
        ref.read(mainProvider).addTodo(value);
      }
    });
  }
}
