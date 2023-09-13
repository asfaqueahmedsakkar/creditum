import 'package:creditum/app/core/components/account_tile.dart';
import 'package:creditum/app/core/components/amount_input_area.dart';
import 'package:creditum/app/core/components/drop_down_area.dart';
import 'package:creditum/app/core/components/m_button.dart';
import 'package:creditum/app/core/components/my_card.dart';
import 'package:creditum/app/core/components/text_area.dart';
import 'package:creditum/app/core/extensions/string_extenstion.dart';
import 'package:creditum/app/core/utility/text_formatter.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:creditum/app/core/values/enums.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        children: [
          Obx(() => Row(
                children: TransactionType.values
                    .map(
                      (e) => Expanded(
                        child: Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () => controller.changeTransactionType(e),
                            child: MyCard(
                              padding: EdgeInsets.zero,
                              color:
                                  e == controller.selectedTransactionType.value
                                      ? primaryColor
                                      : Colors.white,
                              child: Center(
                                child: Text(
                                  e.name.toCamellaCase(),
                                  style: TextStyle(
                                    color: e !=
                                            controller
                                                .selectedTransactionType.value
                                        ? primaryColor
                                        : Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )),
          const SizedBox(height: 16),
          AmountInputArea(
            controller: controller.amountController,
          ),
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => DropdownArea<AccountType>(
                    onItemPick: controller.accountType,
                    items: AccountType.values,
                    label: "Account type",
                    selectedItem: controller.accountType.value,
                    itemName: (item) =>
                        "${item.name.toCamellaCase(characterToReplaceWith: " ")}",
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Obx(
                  () => DropdownArea<AccountType>(
                    onItemPick: controller.accountType,
                    items: AccountType.values,
                    label: "Account type",
                    selectedItem: controller.accountType.value,
                    itemName: (item) =>
                        "${item.name.toCamellaCase(characterToReplaceWith: " ")}",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
