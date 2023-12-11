import 'package:flutter/material.dart';

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
            const Text('오늘의 목표 : 10개'),
            const Text('미달성 목표 : 10개'),
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
