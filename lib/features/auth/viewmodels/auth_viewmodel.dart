import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../core/enums/app_enums.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;
  final RxBool isGoogleLoading = false.obs;
  final RxString errorMessage = ''.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final Rx<UserRole> selectedRole = UserRole.parent.obs;

  @override
  void onInit() {
    super.onInit();
    checkInitialSession();
  }

  Future<void> checkInitialSession() async {
    final cachedUser = await _authRepository.getCachedUser();
    if (cachedUser != null) {
      currentUser.value = cachedUser;
      _navigateToRoleDashboard(cachedUser);
    }
  }

  Future<void> loginWithEmail() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final user = await _authRepository.signInWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (user != null) {
        currentUser.value = user;
        if (!user.isEmailVerified) {
          Get.offNamed('/email-verification');
        } else {
          _navigateToRoleDashboard(user);
        }
      }
    } catch (e) {
      errorMessage.value = e.toString().replaceAll('Exception: ', '');
      Get.snackbar(
        'Login Failed',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registerWithEmail() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final user = await _authRepository.signUpWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        name: nameController.text.trim(),
        role: selectedRole.value,
      );
      if (user != null) {
        currentUser.value = user;
        Get.offNamed('/email-verification');
      }
    } catch (e) {
      errorMessage.value = e.toString().replaceAll('Exception: ', '');
      Get.snackbar(
        'Registration Failed',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      isGoogleLoading.value = true;
      errorMessage.value = '';
      final user = await _authRepository.signInWithGoogle();
      if (user != null) {
        currentUser.value = user;
        _navigateToRoleDashboard(user);
      }
    } catch (e) {
      errorMessage.value = e.toString().replaceAll('Exception: ', '');
      Get.snackbar(
        'Google Auth Failed',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
    } finally {
      isGoogleLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    currentUser.value = null;
    Get.offAllNamed('/login');
  }

  void _navigateToRoleDashboard(UserModel user) {
    switch (user.role) {
      case UserRole.admin:
        Get.offAllNamed('/admin/shell');
        break;
      case UserRole.driver:
        Get.offAllNamed('/driver/shell');
        break;
      case UserRole.parent:
        Get.offAllNamed('/parent/shell');
        break;
      case UserRole.student:
        Get.offAllNamed('/student/shell');
        break;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
