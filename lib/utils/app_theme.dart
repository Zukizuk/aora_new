import 'package:flutter/material.dart';
import 'theme.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.background,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary, // Button background color
      textTheme: ButtonTextTheme.primary, // Button text color
    ),
  );
}
