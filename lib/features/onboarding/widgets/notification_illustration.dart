import 'package:flutter/material.dart';
import '../constants/onboarding_theme.dart';

class NotificationIllustration extends StatefulWidget {
  const NotificationIllustration({super.key});

  @override
  State<NotificationIllustration> createState() => _NotificationIllustrationState();
}

class _NotificationIllustrationState extends State<NotificationIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = (size.width * 0.72).clamp(240.0, 310.0);

    return AnimatedBuilder(
      animation: _floatController,
      builder: (context, _) {
        final floatOffset = _floatController.value * 6.0;

        return SizedBox(
          width: width,
          height: width * 0.85,
          child: Stack(
            children: [
              // Bottom Card
              Positioned(
                top: 70 + floatOffset,
                left: 10,
                right: 10,
                child: _buildNotificationTile(
                  icon: Icons.school_rounded,
                  title: 'Ali reached school',
                  time: '07:58 AM',
                  color: OnboardingColors.softBeige,
                ),
              ),

              // Middle Card
              Positioned(
                top: 40 - floatOffset * 0.5,
                left: 0,
                right: 0,
                child: _buildNotificationTile(
                  icon: Icons.directions_bus_rounded,
                  title: 'Van arriving in 5 mins',
                  time: '07:27 AM',
                  color: OnboardingColors.warmGold,
                ),
              ),

              // Top Card
              Positioned(
                top: 10 + floatOffset * 0.5,
                left: 15,
                right: 15,
                child: _buildNotificationTile(
                  icon: Icons.check_circle_rounded,
                  title: 'Ali boarded VAN-02',
                  time: '07:32 AM',
                  color: OnboardingColors.teal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String time,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: OnboardingColors.veryDarkForest.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.4), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.18),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: OnboardingColors.offWhite,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: OnboardingColors.softBeige.withOpacity(0.7),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
