import 'package:flutter/material.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';
import 'package:todo_application/src/features/main/presentation/pages/main_page/local_widgets/add_todo_fab.dart';
import 'package:todo_application/src/features/main/presentation/pages/main_page/local_widgets/goal_status.dart';
import 'package:todo_application/src/features/main/presentation/pages/main_page/local_widgets/todo_tile.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AchievedTodo(),
            const NotAchievedTodo(),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TodoTile(todoStatus: TodoStatus.values[index]);
                },
                itemCount: TodoStatus.values.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const AddTodoFAB(),
    );
  }
}
