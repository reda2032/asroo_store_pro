import 'package:asroo_store/core/routes/base_routes.dart';
import 'package:flutter/material.dart';

import '../../features/splash/presentation/views/splash_screen.dart';
import '../../test_one_screen.dart';
import '../../test_two_screen.dart';
import '../common/screens/under_build_screen.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String testOne = 'testOne';
  static const String testTwo = 'testTwo';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return BaseRoute(page: const SplashScreen());
      case testOne:
        return BaseRoute(page: const TestOneScreen());
      case testTwo:
        return BaseRoute(page: const TestTwoScreen());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
