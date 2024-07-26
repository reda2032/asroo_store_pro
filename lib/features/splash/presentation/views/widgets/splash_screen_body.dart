import 'package:flutter/material.dart';

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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          image: AssetImage(AppImages.splashScreen),
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  void excuteNaviagtion() {
    Future.delayed(const Duration(seconds: 6), () {
      //   Navigator.pushReplacementNamed(context, SigninView.routeName);
    });
  }
}
