import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/enums/app_enums.dart';
import '../../../core/utils/validators.dart';
import '../../../shared/widgets/app_buttons.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../viewmodels/auth_viewmodel.dart';

class RegisterView extends GetView<AuthViewModel> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.02,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Join Van Safety Platform',
                  style: TextStyle(
                    fontSize: (size.width * 0.06).clamp(20.0, 26.0),
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Text(
                  'Select your role and enter account details',
                  style: TextStyle(
                    fontSize: (size.width * 0.038).clamp(12.0, 15.0),
                    color: theme.colorScheme.onSurface.withOpacity(0.65),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  'Account Role',
                  style: TextStyle(
                    fontSize: (size.width * 0.036).clamp(12.0, 15.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Obx(
                  () => Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: UserRole.values.map((role) {
                      final isSelected = controller.selectedRole.value == role;
                      return ChoiceChip(
                        label: Text(
                          role.value,
                          style: TextStyle(
                            color: isSelected ? Colors.white : theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: AppColors.deepForest,
                        backgroundColor: theme.cardColor,
                        onSelected: (_) => controller.selectedRole.value = role,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                AppTextField(
                  controller: controller.nameController,
                  labelText: 'Full Name',
                  hintText: 'e.g. Muhammad Ali',
                  prefixIcon: const Icon(Icons.person_outline),
                  validator: (val) => Validators.required(val, 'Full Name'),
                ),
                SizedBox(height: size.height * 0.02),
                AppTextField(
                  controller: controller.emailController,
                  labelText: 'Email Address',
                  hintText: 'name@school.com',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: Validators.email,
                ),
                SizedBox(height: size.height * 0.02),
                AppTextField(
                  controller: controller.passwordController,
                  labelText: 'Password',
                  hintText: 'Minimum 6 characters',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  validator: Validators.password,
                ),
                SizedBox(height: size.height * 0.04),
                Obx(
                  () => AppPrimaryButton(
                    text: 'Register Account',
                    isLoading: controller.isLoading.value,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.registerWithEmail();
                      }
                    },
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
