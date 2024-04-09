import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_application/src/core/contants/app_constants.dart';
import 'package:todo_application/src/core/routes/app_pages.dart';

import 'src/dependency_injection.dart';

void main() async {
  await _initialize();
  await initDI();

  runApp(const ProviderScope(child: MyApp()));
}

Future _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);

  packageInfo = await PackageInfo.fromPlatform();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ToDO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppPages.router,
    );
  }
}
