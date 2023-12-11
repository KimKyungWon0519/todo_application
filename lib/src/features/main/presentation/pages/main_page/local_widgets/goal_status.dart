import 'package:flutter/material.dart';

class AchievedTodo extends StatelessWidget {
  const AchievedTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('오늘의 목표 : 10개');
  }
}

class NotAchievedTodo extends StatelessWidget {
  const NotAchievedTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('미달성 목표 : 10개');
  }
}
