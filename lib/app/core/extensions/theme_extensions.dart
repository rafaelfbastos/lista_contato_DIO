import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLigth => Theme.of(this).primaryColorLight;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;
  Color get darkColor => const Color(0xff343838);
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get titleStyle =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}
