import 'dart:ffi';

import 'package:creditum/app/core/components/account_tile.dart';
import 'package:creditum/app/core/components/empty.dart';
import 'package:creditum/app/core/components/loading.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:creditum/app/data/models/account.dart';
import 'package:creditum/app/modules/home/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Accounts extends GetView<AccountController> {
  const Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.accounts.value == null
          ? const Loading()
          : controller.accounts.value!.isEmpty
              ? const Empty()
              : ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8) +
                          const EdgeInsets.only(bottom: 82),
                  itemBuilder: (BuildContext context, int index) {
                    AccountModel account = controller.accounts.value![index];
                    return AccountTile(
                      accountType: account.accountType!,
                      title: account.title!,
                      balance: account.balance!,
                      identifier: account.identifier!,
                    );
                  },
                  itemCount: controller.accounts.value!.length,
                ),
    );
  }
}
