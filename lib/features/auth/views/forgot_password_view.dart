import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/validators.dart';
import '../../../shared/widgets/app_buttons.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../viewmodels/forgot_password_viewmodel.dart';

class ForgotPasswordView extends GetView<ForgotPasswordViewModel> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.03,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(size.width * 0.05),
                    decoration: BoxDecoration(
                      color: AppColors.teal.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_reset_rounded,
                      size: size.width * 0.16,
                      color: AppColors.deepForest,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: (size.width * 0.065).clamp(22.0, 28.0),
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Text(
                    "Enter your registered email address.\nWe'll send you a secure password reset link.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: (size.width * 0.038).clamp(13.0, 15.0),
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  AppTextField(
                    controller: controller.emailController,
                    labelText: 'Email Address',
                    hintText: 'name@school.com',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: Validators.email,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Obx(
                    () => AppPrimaryButton(
                      text: 'Send Reset Link',
                      isLoading: controller.isLoading.value,
                      onPressed: () => controller.sendResetLink(),
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Back to Login',
                      style: TextStyle(
                        fontSize: (size.width * 0.038).clamp(13.0, 15.0),
                        fontWeight: FontWeight.w600,
                        color: AppColors.teal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
