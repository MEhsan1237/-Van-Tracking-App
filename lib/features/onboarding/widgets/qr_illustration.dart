import 'package:flutter/material.dart';
import '../constants/onboarding_theme.dart';

class QrIllustration extends StatefulWidget {
  const QrIllustration({super.key});

  @override
  State<QrIllustration> createState() => _QrIllustrationState();
}

class _QrIllustrationState extends State<QrIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _scanController;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = (size.width * 0.65).clamp(220.0, 280.0);
    final height = width * 1.25;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Student Pass Card Base
          Container(
            width: width,
            height: height,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [OnboardingColors.darkTeal, OnboardingColors.veryDarkForest],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: OnboardingColors.warmGold.withOpacity(0.5), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: OnboardingColors.warmGold.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                // Card Header
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: OnboardingColors.warmGold.withOpacity(0.2),
                      child: const Icon(Icons.security, color: OnboardingColors.warmGold, size: 16),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'STUDENT PASS',
                          style: TextStyle(
                            color: OnboardingColors.warmGold,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          'Ali Ahmad • STU-101',
                          style: TextStyle(
                            color: OnboardingColors.offWhite,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),

                // Abstract QR Grid Visual
                Container(
                  width: width * 0.65,
                  height: width * 0.65,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: OnboardingColors.veryDarkForest,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: OnboardingColors.teal.withOpacity(0.4)),
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                    ),
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      final isFilled = index % 2 == 0 || index % 5 == 0 || index == 12;
                      return Container(
                        decoration: BoxDecoration(
                          color: isFilled
                              ? OnboardingColors.softBeige.withOpacity(0.85)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      );
                    },
                  ),
                ),

                const Spacer(),

                // Status Chip
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  decoration: BoxDecoration(
                    color: OnboardingColors.teal.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: OnboardingColors.teal, width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check_circle, color: OnboardingColors.warmGold, size: 14),
                      const SizedBox(width: 6),
                      Text(
                        'VERIFIED PASS',
                        style: TextStyle(
                          color: OnboardingColors.offWhite,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Animated Vertical Scan Laser Beam
          AnimatedBuilder(
            animation: _scanController,
            builder: (context, _) {
              final topOffset = height * 0.25 + (height * 0.45 * _scanController.value);
              return Positioned(
                top: topOffset,
                left: width * 0.1,
                right: width * 0.1,
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: OnboardingColors.warmGold,
                    boxShadow: [
                      BoxShadow(
                        color: OnboardingColors.warmGold,
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
