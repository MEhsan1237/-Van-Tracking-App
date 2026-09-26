import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/auth_repository.dart';

class ForgotPasswordViewModel extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final emailController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool isSubmitted = false.obs;
  final formKey = GlobalKey<FormState>();

  Future<void> sendResetLink() async {
    if (!formKey.currentState!.validate()) return;
    try {
      isLoading.value = true;
      await _authRepository.sendPasswordReset(emailController.text.trim());
      isSubmitted.value = true;
      Get.snackbar(
        'Reset Email Sent',
        'If an account exists with this email, a reset link has been sent.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade800,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not send reset link. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
