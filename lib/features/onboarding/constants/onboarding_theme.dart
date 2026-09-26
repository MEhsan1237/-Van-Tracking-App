import 'package:flutter/material.dart';

class OnboardingColors {
  static const Color deepForest = Color(0xFF123F36);
  static const Color darkTeal = Color(0xFF1B4D43);
  static const Color teal = Color(0xFF2A6B5C);
  static const Color warmGold = Color(0xFFC49A45);
  static const Color softBeige = Color(0xFFE8DCC4);
  static const Color offWhite = Color(0xFFF9F7F2);

  static const Color backgroundDark = Color(0xFF0D221D);
  static const Color veryDarkForest = Color(0xFF091814);
  static const Color darkMutedWarm = Color(0xFF1F1B14);
  static const Color richForest = Color(0xFF0F332C);

  static const List<LinearGradient> pageGradients = [
    // Page 1 — LIVE TRACKING
    LinearGradient(
      colors: [deepForest, darkTeal],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    // Page 2 — QR SAFETY
    LinearGradient(
      colors: [darkTeal, veryDarkForest],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    // Page 3 — SMART UPDATES
    LinearGradient(
      colors: [deepForest, darkMutedWarm],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    // Page 4 — CONNECTED TRANSPORT
    LinearGradient(
      colors: [richForest, teal],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ];
}

class OnboardingTextStyles {
  static TextStyle heading(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return TextStyle(
      fontSize: (width * 0.07).clamp(24.0, 32.0),
      fontWeight: FontWeight.bold,
      color: OnboardingColors.offWhite,
      letterSpacing: 0.5,
      height: 1.25,
    );
  }

  static TextStyle description(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return TextStyle(
      fontSize: (width * 0.038).clamp(13.0, 16.0),
      color: OnboardingColors.softBeige.withOpacity(0.85),
      height: 1.5,
      letterSpacing: 0.2,
    );
  }
}
