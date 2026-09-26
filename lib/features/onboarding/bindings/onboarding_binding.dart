import 'package:get/get.dart';
import '../viewmodels/onboarding_view_model.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingViewModel>(() => OnboardingViewModel());
  }
}
