import 'package:asroo_store/core/app/connectivity_controller.dart';
import 'package:asroo_store/core/common/screens/no_network_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app/app_cubit/app_cubit.dart';
import 'core/di/injection_container.dart';
import 'core/language/app_localizations_setup.dart';
import 'core/routes/app_routes.dart';
import 'core/service/shared_pref/pref_keys.dart';
import 'core/service/shared_pref/shared_pref.dart';
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
          return BlocProvider(
            create: (context) => sl<AppCubit>()
              ..changeAppThemeMode(
                sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
              )
              ..getSavedLanguage(),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) {
                  return previous != current;
                },
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    title: 'Asroo Store',
                    debugShowCheckedModeBanner: false,
                    //  debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
                    theme: cubit.isDark ? themeLight() : themeDark(),
                    locale: Locale(cubit.currentLangCode),
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
                  );
                },
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
