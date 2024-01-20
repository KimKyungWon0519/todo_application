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
      value: todo.achievedDateTime.isNotEmpty,
      onChanged: (value) => _onChanged(value ?? false, ref),
      title: Text(
        todo.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          decoration: todo.achievedDateTime.isNotEmpty
              ? TextDecoration.lineThrough
              : null,
          color: _getColor(ref),
        ),
      ),
      subtitle: switch (ref.read(mainProvider.notifier).getTodoStatus(todo)) {
        TodoStatus.achieved => _AchievedSubtitle(todo.registeredDateTime),
        TodoStatus.notAchieved => _NotAchievedSubtitle(todo.registeredDateTime),
        _ => null
      },
    );
  }

  Color _getColor(WidgetRef ref) {
    switch (ref.read(mainProvider.notifier).getTodoStatus(todo)) {
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

class _AchievedSubtitle extends ConsumerWidget {
  final String registeredDateTime;

  const _AchievedSubtitle(this.registeredDateTime);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String remainingDate = ref
        .read(mainProvider.notifier)
        .getRemainingDateTime(registeredDateTime)
        .toString();

    return Text('$remainingDate일 후 자동으로 삭제됩니다.');
  }
}

class _NotAchievedSubtitle extends ConsumerWidget {
  final String registeredDateTime;

  const _NotAchievedSubtitle(this.registeredDateTime);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String elapsedDay = ref
        .read(mainProvider.notifier)
        .getElapsedDay(registeredDateTime)
        .toString();

    return Text(
      '등록일($registeredDateTime)로 부터 $elapsedDay일 지났어요.',
      style: const TextStyle(color: Colors.red),
    );
  }
}
