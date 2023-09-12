import 'package:creditum/app/core/components/account_tile.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:creditum/app/modules/home/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Accounts extends GetView<AccountController> {
  const Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8) +
          const EdgeInsets.only(bottom: 82),
      children: const [
        AccountTile(
          accountType: AccountType.cash,
          title: "Cash balance",
          balance: '120',
          identifier: '1235',
        ),
      ],
    );
  }
}
