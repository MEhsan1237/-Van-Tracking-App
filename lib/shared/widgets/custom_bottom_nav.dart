import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../core/constants/app_colors.dart';

class CustomBottomNavItem {
  final IconData icon;
  final String text;

  CustomBottomNavItem({required this.icon, required this.text});
}

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;
  final List<CustomBottomNavItem> items;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.012,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
          vertical: size.height * 0.008,
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.4 : 0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            width: 0.8,
          ),
        ),
        child: GNav(
          rippleColor: AppColors.teal.withOpacity(0.2),
          hoverColor: AppColors.teal.withOpacity(0.1),
          gap: 6,
          activeColor: Colors.white,
          iconSize: (size.width * 0.055).clamp(20.0, 24.0),
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.035,
            vertical: size.height * 0.012,
          ),
          duration: const Duration(milliseconds: 300),
          tabBackgroundColor: AppColors.deepForest,
          color: isDark ? AppColors.darkSecondaryText : AppColors.lightSecondaryText,
          tabs: items
              .map(
                (e) => GButton(
                  icon: e.icon,
                  text: e.text,
                  textStyle: TextStyle(
                    fontSize: (size.width * 0.032).clamp(11.0, 14.0),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              )
              .toList(),
          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
        ),
      ),
    );
  }
}
