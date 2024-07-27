import 'package:asroo_store/core/routes/base_routes.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';
import '../common/screens/under_build_screen.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String login = 'login';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return BaseRoute(page: const SplashScreen());
      case login:
        return BaseRoute(page: const LoginScreen());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
