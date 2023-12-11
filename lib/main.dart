import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_application/src/core/routes/app_pages.dart';

import 'src/dependency_injection.dart';

void main() async {
  await _initialize();
  await initDI();

  runApp(const MyApp());
}

Future _initialize() async {
  await Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppPages.router,
    );
  }
}
