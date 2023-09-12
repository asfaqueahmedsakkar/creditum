import 'package:creditum/app/modules/home/pages/accounts.dart';
import 'package:creditum/app/modules/home/pages/dashboard.dart';
import 'package:creditum/app/modules/home/pages/transactions.dart';
import 'package:creditum/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<NavBarOptions> selectedIndex = NavBarOptions.dashboard.obs;

  IconData? icon(NavBarOptions index) {
    switch (index) {
      case NavBarOptions.dashboard:
        return FontAwesomeIcons.houseChimney;
      case NavBarOptions.analysis:
        return FontAwesomeIcons.chartLine;
      case NavBarOptions.transactions:
        return FontAwesomeIcons.listUl;
      case NavBarOptions.accounts:
        return FontAwesomeIcons.solidCreditCard;
    }
  }

  Widget? showingPage() {
    switch (selectedIndex.value) {
      case NavBarOptions.dashboard:
        return const Dashboard();
      case NavBarOptions.analysis:
        return const SizedBox();
      case NavBarOptions.transactions:
        return const Transactions();
      case NavBarOptions.accounts:
        return const Accounts();
    }
  }

  addAccount() {
    Get.toNamed(Routes.ADD_ACCONT);
  }

  addTransaction() {
    Get.toNamed(Routes.ADD_TRANSACTION);
  }
}

enum NavBarOptions { dashboard, analysis, transactions, accounts }
