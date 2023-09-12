import 'package:creditum/app/core/components/account_tile.dart';
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
                          child: MyCard(
                            padding: EdgeInsets.zero,
                            color: e == controller.selectedTransactionType.value
                                ? primaryColor
                                : primaryColor.withOpacity(0.5),
                            child: Center(
                              child: Text(
                                e.name.toCamellaCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
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
          TextArea(
            controller: controller.titleController,
            label: "Account title",
            hint: "Account title",
          ),
          Obx(
            () => DropdownArea<AccountType>(
              onItemPick: controller.accountType,
              items: AccountType.values,
              label: "Account type",
              selectedItem: controller.accountType.value,
              itemName: (item) =>
                  "${item.name.toCamellaCase(characterToReplaceWith: " ")}",
            ),
          ),
          TextArea(
            controller: controller.accountIdentifier,
            label: "Account identifier",
            hint: "Account identifier",
            textInputType: TextInputType.phone,
            allowedFormatter: [
              TextFormatter.range(max: 8),
            ],
          ),
          TextArea(
            controller: controller.balance,
            label: "Balance",
            hint: "Balance",
            textInputType: TextInputType.phone,
            allowedFormatter: [
              TextFormatter.range(max: 8),
            ],
            prefix: const Icon(
              FontAwesomeIcons.dollarSign,
              size: 16,
            ),
          ),
          MButton(
            title: "Save",
            onTap: () {},
            color: successColor,
          ),
        ],
      ),
    );
  }
}
