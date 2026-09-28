import 'package:get/get.dart';
import '../viewmodels/welcome_view_model.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeViewModel>(() => WelcomeViewModel());
  }
}
