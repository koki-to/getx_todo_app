import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(fontFamily: 'DotGothic', colorScheme: const ColorScheme.light(primary: Colors.cyan, secondary: Colors.pink));

  static final dark = ThemeData(
      fontFamily: 'DotGothic', colorScheme: const ColorScheme.dark(primary: Colors.deepPurple, secondary: Colors.amber, surface: Colors.deepPurple));
}
