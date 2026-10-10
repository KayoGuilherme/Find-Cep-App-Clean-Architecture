import 'package:flutter/material.dart';
import 'package:cep_app/core/ui/cep_app_colors.dart';

sealed class CepAppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CepAppColors.primaryColor,
      onPrimary: CepAppColors.primaryColor,
      secondary: CepAppColors.secondaryColor,
      onSecondary: CepAppColors.secondaryColor,
      error: CepAppColors.errorColor,
      onError: CepAppColors.errorColor,
      surface: CepAppColors.lightBgColor,
      onSurface: CepAppColors.lightBgColor,
    ),
    tabBarTheme: TabBarThemeData(
      unselectedLabelColor: Colors.black.withValues(alpha: 0.5),
      labelColor: CepAppColors.secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: CepAppColors.lightBgColor,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: CepAppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CepAppColors.primaryColor,
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all(Colors.white),
      thumbColor: const WidgetStatePropertyAll(CepAppColors.primaryColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: CepAppColors.primaryColor,
      titleTextStyle: TextStyle(
        color: CepAppColors.secondaryColor,
        fontSize: 16,
      ),
    ),
    scaffoldBackgroundColor: CepAppColors.lightBgColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: CepAppColors.blackColor, fontSize: 14),
      titleMedium: TextStyle(fontSize: 20, color: CepAppColors.blackColor),
      titleLarge: TextStyle(color: CepAppColors.blackColor, fontSize: 24),
    ),
  );

  static final ThemeData dark = light.copyWith(
    tabBarTheme: const TabBarThemeData(
      unselectedLabelColor: Colors.grey,
      labelColor: CepAppColors.primaryColor,
    ),
    appBarTheme: light.appBarTheme.copyWith(backgroundColor: Colors.black87),
    scaffoldBackgroundColor: CepAppColors.darkBgColor,
    brightness: Brightness.dark,
    colorScheme: light.colorScheme.copyWith(
      brightness: Brightness.dark,
      surface: CepAppColors.darkBgColor,
      onSurface: CepAppColors.darkBgColor,
    ),
    textTheme: light.textTheme.copyWith(
      bodyMedium: light.textTheme.bodyMedium!.copyWith(
        color: CepAppColors.whiteColor,
      ),
      titleLarge: light.textTheme.titleLarge!.copyWith(
        color: CepAppColors.whiteColor,
      ),
      titleMedium: light.textTheme.titleMedium!.copyWith(
        color: CepAppColors.whiteColor,
      ),
    ),
    inputDecorationTheme: light.inputDecorationTheme.copyWith(
      fillColor: CepAppColors.blackColor,
    ),
  );
}
