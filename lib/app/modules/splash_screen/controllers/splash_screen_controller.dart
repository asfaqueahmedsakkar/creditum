import 'package:creditum/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () => Get.offNamed(Routes.HOME));
    super.onInit();
  }
}
