// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/app_colors.dart';
// import '../../../core/utils/validators.dart';
// import '../../../shared/widgets/app_buttons.dart';
// import '../../../shared/widgets/app_text_field.dart';
// import '../viewmodels/auth_viewmodel.dart';
//
// class LoginView extends GetView<AuthViewModel> {
//   const LoginView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final size = MediaQuery.sizeOf(context);
//     final formKey = GlobalKey<FormState>();
//
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(
//               horizontal: size.width * 0.06,
//               vertical: size.height * 0.02,
//             ),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Container(
//                       padding: EdgeInsets.all(size.width * 0.04),
//                       decoration: BoxDecoration(
//                         color: AppColors.teal.withOpacity(0.12),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.directions_bus_rounded,
//                         size: size.width * 0.14,
//                         color: AppColors.deepForest,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.02),
//                   Center(
//                     child: Text(
//                       'Welcome Back',
//                       style: TextStyle(
//                         fontSize: (size.width * 0.065).clamp(22.0, 30.0),
//                         fontWeight: FontWeight.bold,
//                         color: theme.colorScheme.onSurface,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.005),
//                   Center(
//                     child: Text(
//                       'Sign in to your school transport account',
//                       style: TextStyle(
//                         fontSize: (size.width * 0.038).clamp(12.0, 15.0),
//                         color: theme.colorScheme.onSurface.withOpacity(0.65),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.04),
//                   AppTextField(
//                     controller: controller.emailController,
//                     labelText: 'Email Address',
//                     hintText: 'name@school.com',
//                     keyboardType: TextInputType.emailAddress,
//                     prefixIcon: const Icon(Icons.email_outlined),
//                     validator: Validators.email,
//                   ),
//                   SizedBox(height: size.height * 0.02),
//                   AppTextField(
//                     controller: controller.passwordController,
//                     labelText: 'Password',
//                     hintText: '••••••••',
//                     obscureText: true,
//                     prefixIcon: const Icon(Icons.lock_outline),
//                     validator: Validators.password,
//                   ),
//                   SizedBox(height: size.height * 0.01),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () => Get.toNamed('/forgot-password'),
//                       child: Text(
//                         'Forgot Password?',
//                         style: TextStyle(
//                           color: AppColors.teal,
//                           fontWeight: FontWeight.w600,
//                           fontSize: (size.width * 0.035).clamp(12.0, 14.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.02),
//                   Obx(
//                     () => AppPrimaryButton(
//                       text: 'Sign In',
//                       isLoading: controller.isLoading.value,
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           controller.loginWithEmail();
//                         }
//                       },
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.025),
//                   Row(
//                     children: [
//                       Expanded(child: Divider(color: theme.dividerColor)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
//                         child: Text(
//                           'OR',
//                           style: TextStyle(
//                             color: theme.colorScheme.onSurface.withOpacity(0.5),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                       Expanded(child: Divider(color: theme.dividerColor)),
//                     ],
//                   ),
//                   SizedBox(height: size.height * 0.025),
//                   Obx(
//                     () => AppOutlinedButton(
//                       text: 'Continue with Google',
//                       isLoading: controller.isGoogleLoading.value,
//                       icon: FaIcon(
//                         FontAwesomeIcons.google,
//                         size: (size.width * 0.05).clamp(16.0, 20.0),
//                         color: Colors.red.shade700,
//                       ),
//                       onPressed: () => controller.loginWithGoogle(),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.04),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Don't have an account? ",
//                         style: TextStyle(
//                           fontSize: (size.width * 0.036).clamp(12.0, 14.0),
//                           color: theme.colorScheme.onSurface.withOpacity(0.7),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => Get.toNamed('/register'),
//                         child: Text(
//                           'Register Now',
//                           style: TextStyle(
//                             fontSize: (size.width * 0.036).clamp(12.0, 14.0),
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.teal,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
