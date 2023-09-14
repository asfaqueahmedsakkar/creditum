import 'package:creditum/app/core/controller/app_controller.dart';
import 'package:creditum/app/data/models/account.dart';
import 'package:creditum/app/data/services/account_service.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  Rx<List<AccountModel>?> accounts = Rx(null);

  @override
  void onReady() {
    super.onReady();
    _loadAccounts();
  }

  _loadAccounts() {
    AccountService()
        .getAccounts(Get.find<AppController>().userId!)
        .then((value) => accounts.value = value);
  }

  addAccount(AccountModel accountModel) async {
    await AccountService().addAccount(accountModel).then((value) {
      accounts.update((val) {
        val!.add(value);
        accounts.value = val;
      });
    });
  }
}
