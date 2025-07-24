import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFF00BFA6);
  static const Color background = Color(0xFFF5F6FA);
  static const Color card = Color(0xFFFFFFFF);
  static const Color text = Color(0xFF22223B);
  static const Color error = Color(0xFFE57373);
  static const Color success = Color(0xFF4CAF50);

  // Dark mode
  static const Color darkBackground = Color(0xFF181A20);
  static const Color darkCard = Color(0xFF23243A);
  static const Color darkText = Color(0xFFF5F6FA);
  static const Color darkPrimary = Color(0xFF8F8CFF);
  static const Color darkSecondary = Color(0xFF00BFA6);
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );
  static const TextStyle body = TextStyle(fontSize: 16, color: AppColors.text);
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

class AppSpaces {
  static const double padding = 24.0;
  static const double radius = 16.0;
  static const double gap = 16.0;
}
