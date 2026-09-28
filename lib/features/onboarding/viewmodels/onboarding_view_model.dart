import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../services/onboarding_local_service.dart';
import '../../auth/viewmodels/auth_viewmodel.dart';

class OnboardingViewModel extends GetxController {
  final OnboardingLocalService _localService = OnboardingLocalService();

  late PageController pageController;
  final RxInt currentPageIndex = 0.obs;

  bool get isLastPage => currentPageIndex.value == 3;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  void nextPage() {
    if (isLastPage) {
      completeOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void skip() {
    completeOnboarding();
  }

  Future<void> completeOnboarding() async {
    await _localService.setOnboardingCompleted();
    if (Get.isRegistered<AuthViewModel>()) {
      final authVm = Get.find<AuthViewModel>();
      if (authVm.currentUser.value != null) {
        authVm.checkInitialSession();
      } else {
        Get.offAllNamed(AppRoutes.welcome);
      }
    } else {
      Get.offAllNamed(AppRoutes.welcome);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
