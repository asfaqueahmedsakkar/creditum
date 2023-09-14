import 'package:creditum/app/modules/home/controllers/account_controller.dart';
import 'package:creditum/app/modules/home/controllers/dashboard_controller.dart';
import 'package:creditum/app/modules/home/controllers/transaction_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<TransactionController>(TransactionController());
    Get.put<DashboardController>(DashboardController());
    Get.put<AccountController>(AccountController());
  }
}
