import 'package:creditum/app/core/components/account_tile.dart';
import 'package:creditum/app/core/components/drop_down_area.dart';
import 'package:creditum/app/core/components/m_button.dart';
import 'package:creditum/app/core/components/text_area.dart';
import 'package:creditum/app/core/extensions/string_extenstion.dart';
import 'package:creditum/app/core/utility/text_formatter.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/add_accont_controller.dart';

class AddAccontView extends GetView<AddAccontController> {
  const AddAccontView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          "Add Account",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.save,
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
          ValueListenableBuilder(
            valueListenable: controller.titleController,
            builder: (_, title, __) => ValueListenableBuilder(
              valueListenable: controller.accountIdentifier,
              builder: (_, identifier, __) => ValueListenableBuilder(
                valueListenable: controller.balance,
                builder: (_, balance, __) => Obx(
                  () => AccountTile(
                    accountType: controller.accountType.value,
                    title: title.text,
                    balance: balance.text,
                    identifier: identifier.text,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            ()=> TextArea(
              controller: controller.titleController,
              label: "Account title",
              hint: "Account title",
              error: controller.titleError.value,
            ),
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
          Obx(
            ()=> TextArea(
              controller: controller.accountIdentifier,
              label: "Account identifier",
              hint: "Account identifier",
              textInputType: TextInputType.phone,
              error: controller.identifierError.value,
              allowedFormatter: [
                TextFormatter.range(max: 8),
              ],
            ),
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
        ],
      ),
    );
  }
}
