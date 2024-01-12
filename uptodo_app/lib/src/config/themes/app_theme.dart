import 'package:flutter/material.dart';
import 'package:uptodo_app/src/config/themes/app_colors.dart';

abstract class AppTheme {
  static final dark = ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.primaryWhite),
      bodySmall: TextStyle(color: AppColors.primaryWhite),
    ),
    colorSchemeSeed: AppColors.systemPurple,
    appBarTheme: const AppBarTheme(color: AppColors.backgroundBlack),
    scaffoldBackgroundColor: AppColors.backgroundBlack,
    canvasColor: AppColors.backgroundBlack,
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF8875FF),
    ),
  );
}
