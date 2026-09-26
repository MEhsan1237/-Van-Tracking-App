import 'package:get/get.dart';
import '../../core/theme/theme_controller.dart';
import '../../features/auth/viewmodels/auth_viewmodel.dart';
import '../../data/services/local_storage_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<LocalStorageService>(LocalStorageService(), permanent: true);
    Get.put<AuthViewModel>(AuthViewModel(), permanent: true);
  }
}
