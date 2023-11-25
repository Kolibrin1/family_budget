import 'package:family_budget/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

abstract class AppTheme {
  AppTheme._();

  static const double offset = 16;
  static const double radius = 10.0;
  static const double elevation = 6.0;
  static const double iconSize = 18.0;
  static const circularRadius = BorderRadius.all(Radius.circular(radius));
  static const boxShadow = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 13,
      offset: Offset(1, 4),
    ),
  ];

  static final theme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.colorScheme,
    scaffoldBackgroundColor: AppColors.colorScheme.background,
    useMaterial3: false,

    dividerColor: AppColors.colorScheme.primary,


    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF2072CC),
      ),
    ),

    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: const IconThemeData(
        color: AppColors.text,
      ),
      centerTitle: true,
      titleTextStyle: AppTextStyles.textStyle16w600,
      backgroundColor: AppColors.colorScheme.background,
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      backgroundColor: AppColors.colorScheme.onBackground,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextStyles.textStyle14w500.copyWith(
        color: AppColors.colorScheme.outline,
      ),
      unselectedLabelStyle: AppTextStyles.textStyle14w500.copyWith(
        color: AppColors.colorScheme.secondary,
      ),
      selectedItemColor: AppColors.colorScheme.secondary,
      unselectedItemColor: AppColors.colorScheme.outline,
    ),
  );
}
