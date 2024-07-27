import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/style/images/app_images.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashScreen),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  void excuteNaviagtion() {
    Future.delayed(const Duration(seconds: 2), () {
      context.pushName(AppRoutes.login);
      //   Navigator.pushReplacementNamed(context, SigninView.routeName);
    });
  }
}
