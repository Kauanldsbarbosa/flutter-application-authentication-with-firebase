import 'package:authenticate/ui/themes/app_colors.dart';
import 'package:authenticate/ui/themes/app_text_thema.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColorsLight.primary,
      scaffoldBackgroundColor: AppColorsLight.background,
      colorScheme: const ColorScheme.light(
        primary: AppColorsLight.primary,
        secondary: AppColorsLight.secondary,
        surface: AppColorsLight.backgroundSecondary,
        error: AppOperationResult.error,
        onPrimary: AppColorsLight.secondary,
        onSecondary: AppColorsLight.accentColor,
        onError: AppColorsLight.accentColor,
        onSurface: AppColorsLight.accentColor,
      ),
      textTheme: AppTextThema.textTheme);

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColorsDark.primary,
      scaffoldBackgroundColor: AppColorsDark.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColorsDark.primary,
        secondary: AppColorsDark.secondary,
        surface: AppColorsDark.backgroundSecondary,
        error: AppOperationResult.error,
        onPrimary: AppColorsDark.secondary,
        onSecondary: AppColorsDark.accentColor,
        onError: AppColorsDark.accentColor,
        onSurface: AppColorsDark.accentColor,
      ),
      textTheme: AppTextThema.textTheme);
}
