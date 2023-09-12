import 'dart:ui';

import 'package:creditum/app/core/values/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  TextEditingController titleController = TextEditingController();

  Rx<AccountType> accountType = AccountType.card.obs;

  TextEditingController accountIdentifier = TextEditingController();

  TextEditingController balance = TextEditingController(text: "0");

  Rx<TransactionType> selectedTransactionType = TransactionType.debit.obs;

  @override
  void dispose() {
    titleController.dispose();
    accountIdentifier.dispose();
    balance.dispose();
    super.dispose();
  }
}
