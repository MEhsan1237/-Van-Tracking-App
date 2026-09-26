import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/auth_repository.dart';
import 'auth_viewmodel.dart';

class VerificationViewModel extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final AuthViewModel _authViewModel = Get.find<AuthViewModel>();

  final RxInt timerSeconds = 45.obs;
  final RxBool canResend = false.obs;
  final RxBool isChecking = false.obs;
  final RxBool isResending = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    timerSeconds.value = 45;
    canResend.value = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  String get formattedTime {
    final secs = timerSeconds.value.remainder(60).toString().padLeft(2, '0');
    return '00:$secs';
  }

  Future<void> checkVerification() async {
    try {
      isChecking.value = true;
      final isVerified = await _authRepository.checkEmailVerified();
      if (isVerified) {
        Get.snackbar(
          'Email Verified',
          'Your email address has been successfully verified!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.shade800,
          colorText: Colors.white,
        );
        final user = await _authRepository.getCachedUser();
        if (user != null) {
          _authViewModel.currentUser.value = user;
          _authViewModel.loginWithEmail(); // Route to role dashboard
        }
      } else {
        Get.snackbar(
          'Not Verified Yet',
          'Please click the link sent to your email inbox.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.shade800,
          colorText: Colors.white,
        );
      }
    } finally {
      isChecking.value = false;
    }
  }

  Future<void> resendEmail() async {
    if (!canResend.value) return;
    try {
      isResending.value = true;
      await _authRepository.sendEmailVerification();
      Get.snackbar(
        'Verification Sent',
        'A new verification link has been sent to your email.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade800,
        colorText: Colors.white,
      );
      startCountdown();
    } finally {
      isResending.value = false;
    }
  }

  Future<void> switchAccount() async {
    _timer?.cancel();
    await _authViewModel.logout();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
