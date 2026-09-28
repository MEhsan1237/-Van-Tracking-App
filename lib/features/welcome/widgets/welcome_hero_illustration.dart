import 'package:flutter/material.dart';

class WelcomeHeroIllustration extends StatelessWidget {
  const WelcomeHeroIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final illustrationHeight = (size.height * 0.34).clamp(230.0, 320.0);
    final illustrationWidth = (size.width * 0.95).clamp(320.0, 480.0);

    return SizedBox(
      width: illustrationWidth,
      height: illustrationHeight,
      child: Center(
        child: Image.asset(
          'assets/images/welcome_van.png',
          fit: BoxFit.contain,
          width: illustrationWidth,
          height: illustrationHeight,
        ),
      ),
    );
  }
}
