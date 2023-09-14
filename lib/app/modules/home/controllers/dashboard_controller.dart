import 'package:creditum/app/core/controller/app_controller.dart';
import 'package:creditum/app/data/services/transaction_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<String?> balance = Rx("0");

  @override
  void onReady() {
    super.onReady();
    _loadBalance();
  }

  void _loadBalance() {
    TransactionService().getBalance(Get.find<AppController>().userId!).then((value) => balance.value=value);
  }

}
