import 'package:flutter/material.dart';
import '../constants/onboarding_theme.dart';

class TrackingIllustration extends StatefulWidget {
  const TrackingIllustration({super.key});

  @override
  State<TrackingIllustration> createState() => _TrackingIllustrationState();
}

class _TrackingIllustrationState extends State<TrackingIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final cardSize = (size.width * 0.72).clamp(240.0, 320.0);

    return Container(
      width: cardSize,
      height: cardSize * 0.85,
      decoration: BoxDecoration(
        color: OnboardingColors.deepForest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: OnboardingColors.teal.withOpacity(0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: AnimatedBuilder(
        animation: _animController,
        builder: (context, _) {
          final progress = _animController.value;
          return Stack(
            children: [
              // Custom Route Line & Markers
              CustomPaint(
                size: Size.infinite,
                painter: RouteMapPainter(progress: progress),
              ),

              // Pickup Stop Marker
              Positioned(
                left: cardSize * 0.15,
                bottom: cardSize * 0.22,
                child: _buildLocationNode('Pickup', Icons.location_on, OnboardingColors.warmGold),
              ),

              // School Marker
              Positioned(
                right: cardSize * 0.15,
                top: cardSize * 0.18,
                child: _buildLocationNode('School', Icons.school, OnboardingColors.softBeige),
              ),

              // Moving Van Representation
              Positioned(
                left: cardSize * (0.18 + progress * 0.45),
                top: cardSize * (0.55 - progress * 0.3),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: OnboardingColors.warmGold,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: OnboardingColors.warmGold.withOpacity(0.6),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.directions_bus_rounded,
                    color: OnboardingColors.veryDarkForest,
                    size: 20,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLocationNode(String title, IconData icon, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 1.5),
          ),
          child: Icon(icon, color: color, size: 16),
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

class RouteMapPainter extends CustomPainter {
  final double progress;

  RouteMapPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = OnboardingColors.teal.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final dashPaint = Paint()
      ..color = OnboardingColors.warmGold.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final path = Path();
    final start = Offset(size.width * 0.2, size.height * 0.7);
    final control = Offset(size.width * 0.4, size.height * 0.2);
    final end = Offset(size.width * 0.8, size.height * 0.3);

    path.moveTo(start.dx, start.dy);
    path.quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);

    canvas.drawPath(path, paint);

    // Draw active path progress
    final metric = path.computeMetrics().first;
    final extractPath = metric.extractPath(0.0, metric.length * progress);
    canvas.drawPath(extractPath, dashPaint);
  }

  @override
  bool shouldRepaint(covariant RouteMapPainter oldDelegate) => true;
}
