import 'dart:ui';

import 'package:creditum/app/core/components/amount_input_area.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:creditum/app/data/models/account.dart';
import 'package:creditum/app/data/models/category.dart';
import 'package:creditum/app/data/models/tag.dart';
import 'package:creditum/app/modules/home/controllers/account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  TextEditingController titleController = TextEditingController();

  Rx<AccountType> accountType = AccountType.card.obs;

  TextEditingController accountIdentifier = TextEditingController();

  TextEditingController balance = TextEditingController(text: "0");

  Rx<TransactionType> selectedTransactionType = TransactionType.debit.obs;

  AmountInputAreaController amountController = AmountInputAreaController();

  Rx<List<TagModel>> selectedTags = Rx([]);
  Rx<List<TagModel>> allTags = Rx([]);

  Rx<AccountModel?> fromAccount = Rx(null);
  Rx<AccountModel?> toAccount = Rx(null);
  Rx<CategoryModel?> selectedCategory = Rx(null);

  Rx<List<AccountModel>?> get accounts =>
      Get.find<AccountController>().accounts;

  Rx<List<CategoryModel>> categories = Rx([]);

  Rx<DateTime> date = Rx(DateTime.now());

  @override
  void dispose() {
    titleController.dispose();
    accountIdentifier.dispose();
    balance.dispose();
    super.dispose();
  }

  void changeTransactionType(TransactionType e) {
    selectedTransactionType.value = e;
  }

  addSelectedTag(TagModel tag) {
    selectedTags.update((val) {
      val!.add(tag);
      selectedTags.value = val;
    });
  }

  removeTag(TagModel tag) {
    selectedTags.update((val) {
      val!.remove(tag);
      selectedTags.value = val;
    });
  }
}
