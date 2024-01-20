import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Todo 입력해주세요.'),
      content: TextField(controller: _controller),
      actions: [
        TextButton(
          onPressed: () => _addEvent(),
          child: const Text('추가'),
        ),
      ],
    );
  }

  void _addEvent() {
    context.pop(_controller.text);
  }
}
