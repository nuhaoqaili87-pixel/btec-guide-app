import 'package:flutter/material.dart';

/// ألوان الهوية البصرية لدليل BTEC
class AppColors {
  static const ink = Color(0xFF14213D);
  static const inkSoft = Color(0xFF1E3159);
  static const paper = Color(0xFFF7F3EA);
  static const paperDim = Color(0xFFEFE8D8);
  static const paperCard = Color(0xFFFFFDF7);
  static const gold = Color(0xFFC89B3C);
  static const goldDim = Color(0xFFE4C878);
  static const teal = Color(0xFF2E7D6B);
  static const tealDim = Color(0xFFDCEAE5);
  static const rust = Color(0xFFB4552E);
  static const rustDim = Color(0xFFF3DFD3);
  static const text = Color(0xFF1B2436);
  static const muted = Color(0xFF5B6478);
  static const line = Color(0xFFDCD3BE);
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.paper,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.ink,
        primary: AppColors.ink,
        secondary: AppColors.gold,
        tertiary: AppColors.teal,
        surface: AppColors.paperCard,
        error: AppColors.rust,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.paper,
        foregroundColor: AppColors.ink,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.ink,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink, fontSize: 30, height: 1.3),
        headlineMedium: TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink, fontSize: 24, height: 1.3),
        titleLarge: TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink, fontSize: 19),
        titleMedium: TextStyle(fontWeight: FontWeight.w600, color: AppColors.ink, fontSize: 16),
        bodyLarge: TextStyle(color: AppColors.text, fontSize: 15.5, height: 1.6),
        bodyMedium: TextStyle(color: AppColors.muted, fontSize: 14, height: 1.6),
      ),
      cardTheme: CardTheme(
        color: AppColors.paperCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.line),
        ),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.ink,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.ink,
          side: const BorderSide(color: AppColors.line),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.paperCard,
        side: const BorderSide(color: AppColors.line),
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.line, thickness: 1),
    );
  }
}
