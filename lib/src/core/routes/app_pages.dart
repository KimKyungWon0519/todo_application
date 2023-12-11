import 'package:go_router/go_router.dart';
import 'package:todo_application/src/core/routes/app_routes.dart';
import 'package:todo_application/src/features/main/presentation/pages/main_page/main_page.dart';

final class AppPages {
  const AppPages._();

  static const String _initializeRoute = AppRoutes.main;

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.main,
        builder: (context, state) => const MainPage(),
      ),
    ],
    initialLocation: _initializeRoute,
  );
}
