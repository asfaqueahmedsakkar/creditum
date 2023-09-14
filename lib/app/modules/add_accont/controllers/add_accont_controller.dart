import 'dart:ui';

import 'package:creditum/app/core/controller/app_controller.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:creditum/app/data/models/account.dart';
import 'package:creditum/app/data/services/account_service.dart';
import 'package:creditum/app/modules/home/controllers/account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAccontController extends GetxController {
  TextEditingController titleController = TextEditingController();

  Rx<AccountType> accountType = AccountType.card.obs;

  TextEditingController accountIdentifier = TextEditingController();

  TextEditingController balance = TextEditingController(text: "0");

  Rx<String?> titleError = Rx(null);
  Rx<String?> accountError = Rx(null);
  Rx<String?> identifierError = Rx(null);
  Rx<String?> balanceError = Rx(null);

  @override
  void dispose() {
    titleController.dispose();
    accountIdentifier.dispose();
    balance.dispose();
    super.dispose();
  }

  void save() async{
    bool error = false;
    if (titleController.text.isEmpty) {
      error = true;
      titleError.value = "Provide a title";
    } else {
      titleError.value = null;
    }
    if (accountIdentifier.text.isEmpty) {
      error = true;
      identifierError.value = "Provide a title";
    } else {
      identifierError.value = null;
    }
    if (!error) {

      await Get.find<AccountController>().addAccount(AccountModel(
          title: titleController.text,
          accountType: accountType.value,
          identifier: accountIdentifier.text,
          balance: balance.text.isEmpty ? "0" : balance.text,
          createdBy: Get.find<AppController>().userId));
      Get.back();

    }
  }
}
