import 'package:flutter/material.dart';

import '../style/theme/color_extension.dart';
import '../style/theme/image_extension.dart';

extension ContextExt on BuildContext {
  //color
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  // images

  MyImages get assets => Theme.of(this).extension<MyImages>()!;

  // navigation
  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();
}
