import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AppStatusChip extends StatelessWidget {
  final String status;
  final IconData? customIcon;
  final Color? customBgColor;
  final Color? customTextColor;

  const AppStatusChip({
    super.key,
    required this.status,
    this.customIcon,
    this.customBgColor,
    this.customTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final String s = status.toUpperCase();

    Color bgColor;
    Color textColor;
    IconData icon;

    if (s.contains('PRESENT') || s.contains('AUTHORIZED') || s.contains('COMPLETED') || s.contains('PAID') || s.contains('APPROVED')) {
      bgColor = AppColors.success.withOpacity(0.12);
      textColor = AppColors.success;
      icon = Icons.check_circle_rounded;
    } else if (s.contains('ONBOARD') || s.contains('ROUTE') || s.contains('PROGRESS')) {
      bgColor = AppColors.info.withOpacity(0.12);
      textColor = AppColors.info;
      icon = Icons.directions_bus_rounded;
    } else if (s.contains('PENDING') || s.contains('WARNING') || s.contains('WAITING')) {
      bgColor = AppColors.warning.withOpacity(0.15);
      textColor = AppColors.warning;
      icon = Icons.access_time_filled_rounded;
    } else if (s.contains('ABSENT') || s.contains('UNAUTHORIZED') || s.contains('OVERDUE') || s.contains('REJECTED') || s.contains('DENIED')) {
      bgColor = AppColors.error.withOpacity(0.12);
      textColor = AppColors.error;
      icon = Icons.cancel_rounded;
    } else if (s.contains('LEAVE')) {
      bgColor = AppColors.warmGold.withOpacity(0.15);
      textColor = AppColors.warmGold;
      icon = Icons.event_busy_rounded;
    } else {
      bgColor = Colors.grey.withOpacity(0.15);
      textColor = Colors.grey.shade700;
      icon = Icons.info_rounded;
    }

    if (customBgColor != null) bgColor = customBgColor!;
    if (customTextColor != null) textColor = customTextColor!;
    if (customIcon != null) icon = customIcon!;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.005,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: textColor.withOpacity(0.3), width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: (size.width * 0.035).clamp(12.0, 16.0), color: textColor),
          SizedBox(width: size.width * 0.015),
          Text(
            status,
            style: TextStyle(
              fontSize: (size.width * 0.03).clamp(11.0, 13.0),
              fontWeight: FontWeight.w700,
              color: textColor,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
