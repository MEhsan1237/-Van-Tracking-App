import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'welcome_hero_clipper.dart';
import 'welcome_hero_illustration.dart';

class WelcomeHeroSection extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;
  final Animation<double> scaleAnimation;

  const WelcomeHeroSection({
    super.key,
    required this.fadeAnimation,
    required this.slideAnimation,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final heroHeight = (size.height * 0.54).clamp(380.0, 520.0);

    return SizedBox(
      height: heroHeight,
      width: double.infinity,
      child: Stack(
        children: [
          // Curved Gradient Background Hero
          ClipPath(
            clipper: WelcomeHeroClipper(),
            child: Container(
              width: double.infinity,
              height: heroHeight,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0C241F),
                    AppColors.deepForest,
                    AppColors.teal,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.020),

                    // Top Heading with Slide + Fade Animation
                    SlideTransition(
                      position: slideAnimation,
                      child: FadeTransition(
                        opacity: fadeAnimation,
                        child: const Text(
                          'Smart School Transport',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.015),

                    // Centered Hero Illustration with Fade + Scale Animation
                    FadeTransition(
                      opacity: fadeAnimation,
                      child: ScaleTransition(
                        scale: scaleAnimation,
                        child: const WelcomeHeroIllustration(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Custom Painted Curved Accent Border
          Positioned.fill(
            child: CustomPaint(
              painter: WelcomeHeroBorderPainter(),
            ),
          ),
        ],
      ),
    );
  }
}
