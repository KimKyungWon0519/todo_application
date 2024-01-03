import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/src/features/main/presentation/presenter/main/state.dart';
import 'package:todo_application/src/features/main/presentation/presenter/providers.dart';

class TodayTodo extends ConsumerWidget {
  const TodayTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoState state = ref.watch(mainProvider);
    int count = state.todayTodoCnt;

    return Text('오늘의 목표 : $count개');
  }
}

class NotAchievedTodo extends ConsumerWidget {
  const NotAchievedTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoState state = ref.watch(mainProvider);
    int count = state.notAchievedTodoCnt;

    return Text('미달성 목표 : $count개');
  }
}
