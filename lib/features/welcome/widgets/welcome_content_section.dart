import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class WelcomeContentSection extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  const WelcomeContentSection({
    super.key,
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            children: [
              Text(
                'Welcome to Smart Ride',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: (size.width * 0.065).clamp(22.0, 30.0),
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepForest,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: size.height * 0.012),
              Text(
                'Track every journey, stay connected, and manage school transportation safely from one place.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: (size.width * 0.038).clamp(13.0, 16.0),
                  height: 1.45,
                  color: AppColors.lightSecondaryText,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
