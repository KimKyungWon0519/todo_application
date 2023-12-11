import 'package:flutter/material.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';

class TodoTile extends StatelessWidget {
  final TodoStatus todoStatus;

  const TodoTile({
    super.key,
    required this.todoStatus,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: todoStatus == TodoStatus.achieved,
      onChanged: (value) {},
      title: Text(
        '테스트 목표' * 10,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          decoration: todoStatus == TodoStatus.achieved
              ? TextDecoration.lineThrough
              : null,
          color: _getColor(),
        ),
      ),
      subtitle: todoStatus == TodoStatus.notAchieved
          ? Text(
              '등록일(2023/01/01)로 부터 10일 지났어요.',
              style: TextStyle(
                color: _getColor(),
              ),
            )
          : null,
    );
  }

  Color _getColor() {
    switch (todoStatus) {
      case TodoStatus.achieved:
        return Colors.grey;
      case TodoStatus.notAchieved:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
