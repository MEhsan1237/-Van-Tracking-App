import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_buttons.dart';
import '../viewmodels/verification_viewmodel.dart';
import '../viewmodels/auth_viewmodel.dart';

class EmailVerificationView extends GetView<VerificationViewModel> {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final authVm = Get.find<AuthViewModel>();
    final email = authVm.currentUser.value?.email ?? 'your registered email';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.07,
              vertical: size.height * 0.03,
            ),
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
                    Icons.mark_email_unread_outlined,
                    size: size.width * 0.16,
                    color: AppColors.deepForest,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  'Verify your email',
                  style: TextStyle(
                    fontSize: (size.width * 0.065).clamp(22.0, 28.0),
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Text(
                  "We've sent a verification link to:",
                  style: TextStyle(
                    fontSize: (size.width * 0.038).clamp(13.0, 15.0),
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: (size.width * 0.042).clamp(14.0, 16.0),
                    fontWeight: FontWeight.bold,
                    color: AppColors.teal,
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Text(
                  'Open your inbox and click the verification link to continue.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (size.width * 0.036).clamp(12.0, 14.0),
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Obx(
                  () => AppPrimaryButton(
                    text: "I've Verified Email",
                    isLoading: controller.isChecking.value,
                    onPressed: () => controller.checkVerification(),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  "Didn't receive the email?",
                  style: TextStyle(
                    fontSize: (size.width * 0.035).clamp(12.0, 14.0),
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Obx(
                  () => controller.canResend.value
                      ? TextButton(
                          onPressed: () => controller.resendEmail(),
                          child: const Text(
                            'Resend Email',
                            style: TextStyle(
                              color: AppColors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Resend Email in ',
                              style: TextStyle(
                                fontSize: 13,
                                color: theme.colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                            Text(
                              controller.formattedTime,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.warmGold,
                              ),
                            ),
                          ],
                        ),
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.info_outline, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      'Check spam/junk folder',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                TextButton(
                  onPressed: () => controller.switchAccount(),
                  child: Text(
                    'Use another account',
                    style: TextStyle(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
