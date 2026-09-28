import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../auth/viewmodels/auth_viewmodel.dart';
import '../../onboarding/services/onboarding_local_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();

    Future.delayed(const Duration(seconds: 2), () async {
      final onboardingService = OnboardingLocalService();
      final completed = await onboardingService.isOnboardingCompleted();

      if (!completed) {
        Get.offAllNamed(AppRoutes.onboarding);
      } else {
        if (Get.isRegistered<AuthViewModel>()) {
          final authVm = Get.find<AuthViewModel>();
          final cachedUser = authVm.currentUser.value;
          if (cachedUser == null) {
            Get.offAllNamed(AppRoutes.welcome);
          } else {
            await authVm.checkInitialSession();
          }
        } else {
          Get.offAllNamed(AppRoutes.welcome);
        }
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: FadeTransition(
          opacity: _fadeAnim,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(size.width * 0.06),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.directions_bus_rounded,
                  size: size.width * 0.2,
                  color: AppColors.warmGold,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                'SAFE VAN',
                style: TextStyle(
                  fontSize: (size.width * 0.08).clamp(24.0, 36.0),
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: size.height * 0.008),
              Text(
                'Student Transport & Safety System',
                style: TextStyle(
                  fontSize: (size.width * 0.038).clamp(12.0, 16.0),
                  color: AppColors.softBeige,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: size.height * 0.06),
              SizedBox(
                width: size.width * 0.1,
                height: size.width * 0.1,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.warmGold),
                  strokeWidth: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
