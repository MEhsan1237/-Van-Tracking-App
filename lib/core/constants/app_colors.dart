import 'package:flutter/material.dart';

class AppColors {
  // Brand Palette
  static const Color deepForest = Color(0xFF123F36); // #123F36
  static const Color teal = Color(0xFF2A6B5C);       // #2A6B5C
  static const Color warmGold = Color(0xFFC49A45);   // #C49A45
  static const Color softBeige = Color(0xFFE8DCC4);  // #E8DCC4

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [deepForest, teal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [warmGold, softBeige],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Light Theme Semantic Tokens
  static const Color lightScaffold = Color(0xFFF7F9F8);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightElevatedSurface = Color(0xFFF0F4F2);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightPrimaryText = Color(0xFF1A2623);
  static const Color lightSecondaryText = Color(0xFF5A6E68);
  static const Color lightBorder = Color(0xFFE0E8E5);
  static const Color lightDivider = Color(0xFFEEF2F0);
  static const Color lightInputBackground = Color(0xFFF3F7F5);

  // Dark Theme Semantic Tokens
  static const Color darkScaffold = Color(0xFF0C1714);
  static const Color darkSurface = Color(0xFF142420);
  static const Color darkElevatedSurface = Color(0xFF1C312C);
  static const Color darkCard = Color(0xFF142420);
  static const Color darkPrimaryText = Color(0xFFECEFF0);
  static const Color darkSecondaryText = Color(0xFF90A49E);
  static const Color darkBorder = Color(0xFF27423B);
  static const Color darkDivider = Color(0xFF1E352F);
  static const Color darkInputBackground = Color(0xFF1A2E29);

  // Status & Utility Colors
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFED6C02);
  static const Color error = Color(0xFFD32F2F);
  static const Color info = Color(0xFF0288D1);
  static const Color disabled = Color(0xFF9E9E9E);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}
