import 'package:flutter/material.dart';
import '../constants/onboarding_theme.dart';

class OnboardingCtaButton extends StatefulWidget {
  final bool isLastPage;
  final VoidCallback onPressed;

  const OnboardingCtaButton({
    super.key,
    required this.isLastPage,
    required this.onPressed,
  });

  @override
  State<OnboardingCtaButton> createState() => _OnboardingCtaButtonState();
}

class _OnboardingCtaButtonState extends State<OnboardingCtaButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _arrowController;

  @override
  void initState() {
    super.initState();
    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _arrowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: OnboardingColors.warmGold.withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: OnboardingColors.warmGold,
          foregroundColor: OnboardingColors.veryDarkForest,
          padding: EdgeInsets.symmetric(
            horizontal: widget.isLastPage ? size.width * 0.08 : size.width * 0.06,
            vertical: (size.height * 0.018).clamp(14.0, 18.0),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.isLastPage ? 'GET STARTED' : 'NEXT',
              style: TextStyle(
                fontSize: (size.width * 0.038).clamp(13.0, 16.0),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: OnboardingColors.veryDarkForest,
              ),
            ),
            const SizedBox(width: 8),
            AnimatedBuilder(
              animation: _arrowController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_arrowController.value * 4.0, 0),
                  child: child,
                );
              },
              child: const Icon(
                Icons.arrow_forward_rounded,
                size: 20,
                color: OnboardingColors.veryDarkForest,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
