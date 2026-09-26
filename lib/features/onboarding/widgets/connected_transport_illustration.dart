import 'package:flutter/material.dart';
import '../constants/onboarding_theme.dart';

class ConnectedTransportIllustration extends StatefulWidget {
  const ConnectedTransportIllustration({super.key});

  @override
  State<ConnectedTransportIllustration> createState() =>
      _ConnectedTransportIllustrationState();
}

class _ConnectedTransportIllustrationState
    extends State<ConnectedTransportIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final cardSize = (size.width * 0.72).clamp(240.0, 310.0);

    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, _) {
        final progress = _pulseController.value;

        return SizedBox(
          width: cardSize,
          height: cardSize,
          child: Stack(
            children: [
              // Custom Connection Lines & Pulse Ring
              CustomPaint(
                size: Size.infinite,
                painter: NetworkLinesPainter(progress: progress),
              ),

              // Center Node — VAN / SAFETY
              Center(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: OnboardingColors.warmGold,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: OnboardingColors.warmGold.withOpacity(0.6),
                        blurRadius: 20 * (0.8 + progress * 0.4),
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.directions_bus_rounded,
                    color: OnboardingColors.veryDarkForest,
                    size: 28,
                  ),
                ),
              ),

              // Top Node — SCHOOL
              Positioned(
                top: 15,
                left: cardSize * 0.5 - 20,
                child: _buildNode('School', Icons.school, OnboardingColors.softBeige),
              ),

              // Bottom Node — STUDENT
              Positioned(
                bottom: 15,
                left: cardSize * 0.5 - 20,
                child: _buildNode('Student', Icons.face, OnboardingColors.softBeige),
              ),

              // Left Node — PARENT
              Positioned(
                top: cardSize * 0.5 - 20,
                left: 15,
                child: _buildNode('Parent', Icons.family_restroom, OnboardingColors.teal),
              ),

              // Right Node — DRIVER
              Positioned(
                top: cardSize * 0.5 - 20,
                right: 15,
                child: _buildNode('Driver', Icons.badge, OnboardingColors.teal),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNode(String title, IconData icon, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: OnboardingColors.veryDarkForest,
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(
            color: OnboardingColors.offWhite,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class NetworkLinesPainter extends CustomPainter {
  final double progress;

  NetworkLinesPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final top = Offset(size.width * 0.5, size.height * 0.15);
    final bottom = Offset(size.width * 0.5, size.height * 0.85);
    final left = Offset(size.width * 0.15, size.height * 0.5);
    final right = Offset(size.width * 0.85, size.height * 0.5);

    final linePaint = Paint()
      ..color = OnboardingColors.teal.withOpacity(0.35)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final pulsePaint = Paint()
      ..color = OnboardingColors.warmGold.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final targets = [top, bottom, left, right];

    for (var target in targets) {
      canvas.drawLine(center, target, linePaint);

      // Pulse traveling along line
      final pulseDx = center.dx + (target.dx - center.dx) * progress;
      final pulseDy = center.dy + (target.dy - center.dy) * progress;
      canvas.drawCircle(Offset(pulseDx, pulseDy), 3.5, pulsePaint);
    }
  }

  @override
  bool shouldRepaint(covariant NetworkLinesPainter oldDelegate) => true;
}
