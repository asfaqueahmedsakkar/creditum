import 'dart:ffi';

import 'package:creditum/app/core/components/amount_input_area.dart';
import 'package:creditum/app/core/components/date_picker_area.dart';
import 'package:creditum/app/core/components/drop_down_area.dart';
import 'package:creditum/app/core/components/my_card.dart';
import 'package:creditum/app/core/components/tag_input_area.dart';
import 'package:creditum/app/core/components/text_area.dart';
import 'package:creditum/app/core/extensions/string_extenstion.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:creditum/app/data/models/account.dart';
import 'package:creditum/app/data/models/category.dart';
import 'package:creditum/app/data/models/tag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/add_transaction_controller.dart';

class AddTransactionView extends GetView<AddTransactionController> {
  const AddTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          "Add Transaction",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.check,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
        ],
        centerTitle: true,
        titleSpacing: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        children: [
          Obx(() => Row(
                children: TransactionType.values
                    .map((e) => _transactionTypeTab(e))
                    .toList(),
              )),
          const SizedBox(height: 16),
          AmountInputArea(
            controller: controller.amountController,
          ),
          Obx(() {
            return Row(
              children: [
                if (controller.selectedTransactionType.value !=
                    TransactionType.credit)
                  _fromAccount(),
                if (controller.selectedTransactionType.value ==
                    TransactionType.transfer)
                  const SizedBox(width: 16),
                if (controller.selectedTransactionType.value !=
                    TransactionType.debit)
                  _toAccount(),
                if (controller.selectedTransactionType.value ==
                    TransactionType.debit)
                  const SizedBox(width: 16),
                if (controller.selectedTransactionType.value ==
                    TransactionType.debit)
                  _debitCategory(),
              ],
            );
          }),
          TextArea(
            controller: controller.titleController,
            label: "Transaction title",
            hint: "Transaction title",
          ),
          Obx(() => DateTimePickerArea(
                label: "Date",
                onDatePick: controller.date,
                selectedDate: controller.date.value,
              )),
          Obx(() => TagInputArea<TagModel>(
                allTags: controller.allTags.value,
                selectedTags: controller.selectedTags.value,
                onNewTag: (tag) async => TagModel(name: tag),
                onTagPick: controller.addSelectedTag,
                removeTag: controller.removeTag,
                label: "Tags",
                getItemName: (tag) => tag.name ?? "",
                getItemId: (tag) => tag.name,
              )),
        ],
      ),
    );
  }

  Expanded _fromAccount() {
    return Expanded(
      child: Obx(
        () => DropdownArea<AccountModel>(
          onItemPick: controller.fromAccount,
          items: controller.accounts.value ?? [],
          label: "From account",
          selectedItem: controller.fromAccount.value,
          itemName: (item) => "${item.title}",
          itemId: (item) => item.id,
        ),
      ),
    );
  }

  Expanded _toAccount() {
    return Expanded(
      child: Obx(
        () => DropdownArea<AccountModel>(
          onItemPick: controller.toAccount,
          items: controller.accounts.value ?? [],
          label: "To account",
          selectedItem: controller.toAccount.value,
          itemName: (item) => "${item.title}",
          itemId: (item) => item.id,
        ),
      ),
    );
  }

  _debitCategory() {
    return Expanded(
      child: Obx(
        () => DropdownArea<CategoryModel>(
          onItemPick: controller.selectedCategory,
          items: controller.categories.value ?? [],
          label: "Category",
          selectedItem: controller.selectedCategory.value,
          itemName: (item) => "${item.name}",
          itemId: (item) => item.id,
        ),
      ),
    );
  }

  Expanded _transactionTypeTab(TransactionType e) {
    bool disable =
        e == TransactionType.transfer && controller.accounts.value!.length <= 1;
    return Expanded(
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: GestureDetector(
          onTap: disable ? null : () => controller.changeTransactionType(e),
          child: MyCard(
            padding: EdgeInsets.zero,
            color: disable
                ? Colors.grey[300]
                : e == controller.selectedTransactionType.value
                    ? primaryColor
                    : Colors.white,
            child: Center(
              child: Text(
                e.name.toCamellaCase(),
                style: TextStyle(
                  color: disable
                      ? Colors.grey
                      :e != controller.selectedTransactionType.value
                      ? primaryColor
                      : Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
