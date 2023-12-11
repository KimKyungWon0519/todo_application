import 'package:flutter/material.dart';
import 'package:todo_application/src/features/main/presentation/pages/main_page/local_widgets/goal_status.dart';

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
            CheckboxListTile(
              value: true,
              onChanged: (value) {},
              title: Text(
                '테스트 목표' * 10,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
            ),
            CheckboxListTile(
              value: false,
              onChanged: (value) {},
              title: Text(
                '테스트 목표' * 10,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              subtitle: const Text(
                '등록일(2023/01/01)로 부터 10일 지났어요.',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            CheckboxListTile(
              value: false,
              onChanged: (value) {},
              title: Text(
                '테스트 목표' * 10,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
