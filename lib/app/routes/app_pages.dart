import 'package:get/get.dart';
import 'app_routes.dart';
import '../bindings/feature_bindings.dart';
import '../../features/splash/views/splash_view.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/onboarding/bindings/onboarding_binding.dart';
import '../../features/welcome/views/welcome_view.dart';
import '../../features/welcome/bindings/welcome_binding.dart';
import '../../features/auth/views/login_view.dart';
import '../../features/auth/views/register_view.dart';
import '../../features/auth/views/email_verification_view.dart';
import '../../features/auth/views/forgot_password_view.dart';
import '../../features/parent/views/parent_shell_view.dart';
import '../../features/student/views/student_shell_view.dart';
import '../../features/driver/views/driver_shell_view.dart';
import '../../features/driver/views/trip_summary_view.dart';
import '../../features/admin/views/admin_shell_view.dart';
import '../../features/notifications/views/notifications_view.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: AppRoutes.emailVerification,
      page: () => const EmailVerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsView(),
    ),

    // Role Shell Routes
    GetPage(
      name: AppRoutes.parentShell,
      page: () => const ParentShellView(),
      binding: ParentBinding(),
    ),
    GetPage(
      name: AppRoutes.studentShell,
      page: () => const StudentShellView(),
      binding: StudentBinding(),
    ),
    GetPage(
      name: AppRoutes.driverShell,
      page: () => const DriverShellView(),
      binding: DriverBinding(),
    ),
    GetPage(
      name: AppRoutes.driverTripSummary,
      page: () => const TripSummaryView(),
      binding: DriverBinding(),
    ),
    GetPage(
      name: AppRoutes.adminShell,
      page: () => const AdminShellView(),
      binding: AdminBinding(),
    ),
  ];
}
