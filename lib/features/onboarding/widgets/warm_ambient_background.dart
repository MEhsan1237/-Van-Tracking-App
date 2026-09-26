import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../constants/onboarding_theme.dart';

class AmbientDotData {
  final double xRatio;
  final double yRatio;
  final double radius;
  final double opacity;
  final Color color;
  final double speedX;
  final double speedY;

  AmbientDotData({
    required this.xRatio,
    required this.yRatio,
    required this.radius,
    required this.opacity,
    required this.color,
    required this.speedX,
    required this.speedY,
  });
}

class WarmAmbientBackground extends StatefulWidget {
  final Widget child;

  const WarmAmbientBackground({super.key, required this.child});

  @override
  State<WarmAmbientBackground> createState() => _WarmAmbientBackgroundState();
}

class _WarmAmbientBackgroundState extends State<WarmAmbientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<AmbientDotData> _dots;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();

    final rand = math.Random(42); // Deterministic seed
    _dots = List.generate(12, (index) {
      final colorOptions = [
        OnboardingColors.warmGold,
        OnboardingColors.softBeige,
        OnboardingColors.teal,
      ];
      return AmbientDotData(
        xRatio: rand.nextDouble(),
        yRatio: rand.nextDouble(),
        radius: 3.0 + rand.nextDouble() * 6.0,
        opacity: 0.15 + rand.nextDouble() * 0.2,
        color: colorOptions[index % colorOptions.length],
        speedX: (rand.nextDouble() - 0.5) * 0.15,
        speedY: (rand.nextDouble() - 0.5) * 0.15,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                size: Size.infinite,
                painter: AmbientDotsPainter(
                  dots: _dots,
                  progress: _controller.value,
                ),
              );
            },
          ),
        ),
        widget.child,
      ],
    );
  }
}

class AmbientDotsPainter extends CustomPainter {
  final List<AmbientDotData> dots;
  final double progress;

  AmbientDotsPainter({required this.dots, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    for (var dot in dots) {
      final dx = ((dot.xRatio + dot.speedX * progress) % 1.0) * size.width;
      final dy = ((dot.yRatio + dot.speedY * progress) % 1.0) * size.height;

      final paint = Paint()
        ..color = dot.color.withOpacity(dot.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(dx, dy), dot.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant AmbientDotsPainter oldDelegate) => true;
}
