import 'package:creditum/app/core/components/account_tile.dart';
import 'package:creditum/app/core/components/text_area.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:flutter/material.dart';

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
        centerTitle: true,
        titleSpacing: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          const AccountTile(accountType: AccountType.none),
          const SizedBox(height: 16),
          SizedBox(
            child: TextArea(
              controller: controller.titleController,
              label: "Account title",
              hint: "Account title",
            ),
          )
        ],
      ),
    );
  }
}
