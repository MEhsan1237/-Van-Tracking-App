// import 'package:flutter/material.dart';
// import '../constants/app_colors.dart';
//
// class AppTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,
//       primaryColor: AppColors.deepForest,
//       scaffoldBackgroundColor: AppColors.lightScaffold,
//       colorScheme: const ColorScheme.light(
//         primary: AppColors.deepForest,
//         secondary: AppColors.teal,
//         tertiary: AppColors.warmGold,
//         surface: AppColors.lightSurface,
//         onPrimary: AppColors.white,
//         onSecondary: AppColors.white,
//         onSurface: AppColors.lightPrimaryText,
//         error: AppColors.error,
//       ),
//       cardTheme: CardThemeData(
//         color: AppColors.lightCard,
//         elevation: 1.5,
//         shadowColor: Colors.black.withOpacity(0.06),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//           side: const BorderSide(color: AppColors.lightBorder, width: 0.8),
//         ),
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: AppColors.lightSurface,
//         foregroundColor: AppColors.lightPrimaryText,
//         elevation: 0,
//         scrolledUnderElevation: 1,
//         centerTitle: false,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: AppColors.lightInputBackground,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.lightBorder),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.lightBorder),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.teal, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.error),
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.deepForest,
//           foregroundColor: AppColors.white,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
//           textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//         ),
//       ),
//     );
//   }
//
//   static ThemeData get darkTheme {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.dark,
//       primaryColor: AppColors.teal,
//       scaffoldBackgroundColor: AppColors.darkScaffold,
//       colorScheme: const ColorScheme.dark(
//         primary: AppColors.teal,
//         secondary: AppColors.warmGold,
//         tertiary: AppColors.softBeige,
//         surface: AppColors.darkSurface,
//         onPrimary: AppColors.white,
//         onSecondary: AppColors.white,
//         onSurface: AppColors.darkPrimaryText,
//         error: AppColors.error,
//       ),
//       cardTheme: CardThemeData(
//         color: AppColors.darkCard,
//         elevation: 1,
//         shadowColor: Colors.black.withOpacity(0.3),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//           side: const BorderSide(color: AppColors.darkBorder, width: 0.8),
//         ),
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: AppColors.darkSurface,
//         foregroundColor: AppColors.darkPrimaryText,
//         elevation: 0,
//         scrolledUnderElevation: 1,
//         centerTitle: false,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: AppColors.darkInputBackground,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.darkBorder),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.darkBorder),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.warmGold, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.error),
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.teal,
//           foregroundColor: AppColors.white,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
//           textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
