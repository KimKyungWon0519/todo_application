import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/src/features/main/domain/entities/todo.dart';
import 'package:todo_application/src/features/main/domain/entities/todo_status.dart';
import 'package:todo_application/src/features/main/presentation/presenter/providers.dart';

class TodoTile extends ConsumerWidget {
  final Todo todo;

  const TodoTile({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      value: todo.status == TodoStatus.achieved,
      onChanged: (value) => _onChanged(value ?? false, ref),
      title: Text(
        todo.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          decoration: todo.status == TodoStatus.achieved
              ? TextDecoration.lineThrough
              : null,
          color: _getColor(),
        ),
      ),
      subtitle: switch (todo.status) {
        TodoStatus.achieved => _AchievedSubtitle(todo.registeredDateTime),
        TodoStatus.notAchieved => const _NotAchievedSubtitle(),
        _ => null
      },
    );
  }

  Color _getColor() {
    switch (todo.status) {
      case TodoStatus.achieved:
        return Colors.grey;
      case TodoStatus.notAchieved:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  void _onChanged(bool value, WidgetRef ref) {
    if (value) {
      ref.read(mainProvider.notifier).achieveTodo(todo);
    } else {
      ref.read(mainProvider.notifier).unachieveTodo(todo);
    }
  }
}

class _AchievedSubtitle extends StatelessWidget {
  final String registeredDateTime;

  const _AchievedSubtitle(this.registeredDateTime);

  @override
  Widget build(BuildContext context) {
    String remainingDate = createRemainingDate();

    return Text('$remainingDate일 후 자동으로 삭제됩니다.');
  }

  String createRemainingDate() {
    DateTime dateTime = DateTime.parse(registeredDateTime);
    int remainingDate = 7 - dateTime.difference(DateTime.now()).inDays.abs();

    return remainingDate.toString();
  }
}

class _NotAchievedSubtitle extends StatelessWidget {
  const _NotAchievedSubtitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '등록일(2023/01/01)로 부터 10일 지났어요.',
      style: TextStyle(color: Colors.red),
    );
  }
}
