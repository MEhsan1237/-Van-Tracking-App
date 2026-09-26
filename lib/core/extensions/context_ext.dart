import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  // Responsive percentage helpers
  double w(double percentage) => screenWidth * (percentage / 100);
  double h(double percentage) => screenHeight * (percentage / 100);

  // Responsive padding/spacing values
  double get paddingSmall => w(2.5);
  double get paddingMedium => w(4.0);
  double get paddingLarge => w(6.0);

  double get spacingSmall => h(1.0);
  double get spacingMedium => h(2.0);
  double get spacingLarge => h(3.5);

  // Responsive font sizes
  double get fontCaption => w(3.0).clamp(10.0, 13.0);
  double get fontBody => w(3.8).clamp(13.0, 16.0);
  double get fontSubtitle => w(4.2).clamp(15.0, 18.0);
  double get fontTitle => w(5.0).clamp(18.0, 22.0);
  double get fontHeadline => w(6.5).clamp(22.0, 30.0);

  bool get isTablet => screenWidth >= 600;
  bool get isDesktop => screenWidth >= 1024;

  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}
