import 'package:flutter/material.dart';

// class AppColors {
//   static const text = Color(0xFF3F4A56);
//   static const subText = Color(0xFF7B7F90);
//   static const white = Color(0xFFffffff);
//   static const checkStatus = Color(0xFFD57300);
//   static const error = Color(0xFFC75757);
//   static const success = Color(0xFF55B14D);
//
//   static ColorScheme colorScheme = const ColorScheme(
//     brightness: Brightness.light,
//     primary: Color(0xFFB0BDD3),
//     onPrimary: Color(0xFFE1E8F3),
//     secondary: Color(0xFF7A99C8),
//     onSecondary: Color(0xFF2072CC),
//     error: Color(0xFFC75757),
//     onError: Color(0xFF55B14D),
//     background: Color(0xFFF8F8F8),
//     onBackground: Color(0xFFFFFFFF),
//     surface: Color(0xFF3F4A56),
//     onSurface: Color(0xFF7B7F90),
//     outline: Color(0xFFAAAAAA),
//     shadow: Color(0xFF000000),
//   );
// }

class AppColors {
  // Основные цвета для темной темы
  static const primary = Color(0xFF8E44AD); // Глубокий фиолетовый
  static final lightPrimary = Color(0xFFAE49A1);
  static const complementaryBlue = Color(0xFF3498DB); // Насыщенный синий оттенок
  static const onPrimary = Color(0xFFF5EEF8); // Нежный светло-фиолетовый
  static const secondary = Color(0xFF5B2C6F); // Темный акцентный фиолетовый
  static const onSecondary = Color(0xFFE8DAEF); // Светло-фиолетовый
  static const background = Color(0xFF1C1C2E); // Темный фон
  static const onBackground = Color(0xFFEDE7F6); // Светлый текст на темном фоне
  static const surface = Color(0xFF2B2B40); // Поверхность, чуть светлее фона
  static const onSurface = Color(0xFFB39DDB); // Светло-фиолетовый текст на поверхности
  static const error = Color(0xFFE74C3C); // Красный для ошибок
  static const onError = Color(0xFFFFCDD2); // Светлый красный для текста ошибок
  static const success = Color(0xFF27AE60); // Зеленый для успешных действий
  static const text = Color(0xFFF5F5F5); // Белый текст
  static const subText = Color(0xFFB2B2B2); // Серый текст для второстепенной информации


  static const button = Color(0xFF9B59B6); // Светло-фиолетовая кнопка
  static const buttonText = Color(0xFFFFFFFF); // Белый текст кнопок
  static const divider = Color(0xFF4A4A5A); // Разделитель



  static const white = Color(0xFFffffff);
  static const checkStatus = Color(0xFFD57300);

  // Цветовая схема для темной темы
  static ColorScheme colorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    error: error,
    onError: onError,
    background: background,
    onBackground: onBackground,
    surface: surface,
    onSurface: onSurface,
    outline: Color(0xFFAAAAAA),
    shadow: Color(0xFF000000),
  );
}

