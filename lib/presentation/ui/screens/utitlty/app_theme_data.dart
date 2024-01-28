import 'package:crafty_bay/presentation/ui/screens/utitlty/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primoryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primoryColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primoryColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primoryColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primoryColor,
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: AppColors.primoryColor,
            padding: const EdgeInsets.symmetric(vertical: 14),
            textStyle: const TextStyle(
              fontSize: 14,
              letterSpacing: 0.5,
            ),
            foregroundColor: Colors.white),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primoryColor,
        ),
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 5,
      ));
}
