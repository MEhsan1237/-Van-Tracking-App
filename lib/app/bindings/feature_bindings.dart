import 'package:get/get.dart';
import '../../features/auth/viewmodels/verification_viewmodel.dart';
import '../../features/auth/viewmodels/forgot_password_viewmodel.dart';
import '../../features/parent/viewmodels/parent_viewmodel.dart';
import '../../features/student/viewmodels/student_viewmodel.dart';
import '../../features/driver/viewmodels/driver_viewmodel.dart';
import '../../features/admin/viewmodels/admin_viewmodel.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationViewModel>(() => VerificationViewModel());
  }
}

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordViewModel>(() => ForgotPasswordViewModel());
  }
}

class ParentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParentViewModel>(() => ParentViewModel());
  }
}

class StudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentViewModel>(() => StudentViewModel());
  }
}

class DriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverViewModel>(() => DriverViewModel());
  }
}

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminViewModel>(() => AdminViewModel());
  }
}
