import 'package:flutter/material.dart';

class AppColors {
  static const text = Color(0xFF3F4A56);
  static const subText = Color(0xFF7B7F90);
  static const white = Color(0xFFffffff);
  static const checkStatus = Color(0xFFD57300);
  static const error = Color(0xFFC75757);
  static const success = Color(0xFF55B14D);

  static ColorScheme colorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFB0BDD3),
    onPrimary: Color(0xFFE1E8F3),
    secondary: Color(0xFF7A99C8),
    onSecondary: Color(0xFF2072CC),
    error: Color(0xFFC75757),
    onError: Color(0xFF55B14D),
    background: Color(0xFFF8F8F8),
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFF3F4A56),
    onSurface: Color(0xFF7B7F90),
    outline: Color(0xFFAAAAAA),
    shadow: Color(0xFF000000),
  );
}
