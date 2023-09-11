import 'package:get/get.dart';

import '../controllers/add_accont_controller.dart';

class AddAccontBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAccontController>(
      () => AddAccontController(),
    );
  }
}
