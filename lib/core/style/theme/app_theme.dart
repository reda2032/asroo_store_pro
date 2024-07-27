import 'package:asroo_store/core/style/colors/colors_dark.dart';
import 'package:asroo_store/core/style/colors/colors_light.dart';
import 'package:flutter/material.dart';

import '../fonts/font_family_helper.dart';
import 'assets_extension.dart';
import 'color_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark, MyAssets.dark],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.white,
        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsLight.mainColor,
      extensions: const <ThemeExtension<dynamic>>[
        MyColors.light,
        MyAssets.light
      ],
      useMaterial3: true,
      textTheme: TextTheme(
        displaySmall: TextStyle(
          fontSize: 14,
          color: ColorsLight.black,
          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
        ),
      ));
}
