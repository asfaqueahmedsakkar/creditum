import 'dart:math';

import 'package:creditum/app/core/values/enums.dart';
import 'package:creditum/app/data/models/account.dart';
import 'package:creditum/app/data/services/account_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  String? userId;

  @override
  void onInit() {
    userId = GetStorage().read("userId");

    if (userId == null) {
      userId = _getId();
      GetStorage().write("userId", userId);
      AccountService().addAccount(AccountModel(
        title: "Cash",
        accountType: AccountType.cash,
        balance: "0",
        identifier: "0001",
        createdBy: userId
      ));
    }
    super.onInit();
  }

  String? _getId() {
    return "xxxhasu";
  }
}
