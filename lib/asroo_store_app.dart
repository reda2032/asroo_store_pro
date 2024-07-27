import 'package:asroo_store/core/app/connectivity_controller.dart';
import 'package:asroo_store/core/common/screens/no_network_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/language/app_localizations_setup.dart';
import 'core/routes/app_routes.dart';
import 'core/style/theme/app_theme.dart';
import 'features/splash/presentation/views/splash_screen.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              title: 'Asroo Store',
              debugShowCheckedModeBanner: false,
              //  debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
              theme: themeDark(),
              locale: const Locale('en'),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              builder: (context, widget) {
                return Scaffold(
                  body: Builder(
                    builder: (context) {
                      ConnectivityController.instance.init();
                      return widget!;
                    },
                  ),
                );
              },

              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: AppRoutes.splash,
              home: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Asroo Store'),
                ),
                body: const SplashScreen(),
              ),
            ),
          );
        } else {
          return const MaterialApp(
            title: 'No NetWork ',
            debugShowCheckedModeBanner: false,
            //  debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
            home: NoNetWorkScreen(),
          );
        }
      },
    );
  }
}
