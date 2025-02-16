import 'package:go_router/go_router.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_controller.dart';
import 'package:monalyse_ui_test/presentation/features/splash/splash_controller.dart';

List<GoRoute> appRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashController(),
    routes: [
      GoRoute(
        path: 'authenticationController',
        builder: (context, state) => const AuthController(),
      ),
    ],
  ),
];
