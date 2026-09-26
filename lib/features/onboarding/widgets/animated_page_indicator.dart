import 'package:flutter/material.dart';
import '../constants/onboarding_theme.dart';

class AnimatedPageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const AnimatedPageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? (size.width * 0.08).clamp(24.0, 34.0) : 8.0,
          decoration: BoxDecoration(
            color: isActive
                ? OnboardingColors.warmGold
                : OnboardingColors.softBeige.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: OnboardingColors.warmGold.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
        );
      }),
    );
  }
}
