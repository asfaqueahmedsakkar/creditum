import 'dart:ui';

import 'package:creditum/app/core/values/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAccontController extends GetxController {
  TextEditingController titleController = TextEditingController();

  Rx<AccountType> accountType = AccountType.card.obs;

  TextEditingController accountIdentifier = TextEditingController();

  TextEditingController balance = TextEditingController(text: "0");

  @override
  void dispose() {
    titleController.dispose();
    accountIdentifier.dispose();
    balance.dispose();
    super.dispose();
  }
}
