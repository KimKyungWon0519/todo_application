import 'package:flutter/material.dart';
import 'package:todo_application/src/core/contants/app_constants.dart';
import 'package:todo_application/src/features/main/presentation/pages/main_page/local_widgets/add_todo_fab.dart';
import 'package:todo_application/src/features/main/presentation/pages/main_page/local_widgets/goal_status.dart';
import 'package:todo_application/src/features/main/presentation/pages/main_page/local_widgets/todo_listview.dart';

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
            const TodayTodo(),
            const NotAchievedTodo(),
            const Divider(),
            const Expanded(
              child: TodoListView(),
            ),
            Text(packageInfo.version)
          ],
        ),
      ),
      floatingActionButton: const AddTodoFAB(),
    );
  }
}
