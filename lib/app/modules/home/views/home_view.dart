import 'package:creditum/app/core/components/cicle_progress.dart';
import 'package:creditum/app/core/components/logo.dart';
import 'package:creditum/app/core/components/my_card.dart';
import 'package:creditum/app/core/components/title_balance.dart';
import 'package:creditum/app/core/components/transaction_tile.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:creditum/app/modules/home/pages/dashboard.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: const Center(
            child: Logo(
          size: 36,
        )),
        titleSpacing: 0,
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Obx(() {
            var textStyle = TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: primaryColor);
            switch (controller.selectedIndex.value) {
              case NavBarOptions.dashboard:
                return Text("Dashboard", style: textStyle);
              case NavBarOptions.analysis:
                return Text("Analysis", style: textStyle);
              case NavBarOptions.transactions:
                return Row(
                  children: [
                    Text("Transactions", style: textStyle),
                    const Spacer(),
                    _addButton(),
                    const SizedBox(width: 8),
                  ],
                );
              case NavBarOptions.accounts:
                return Row(
                  children: [
                    Text("Accounts", style: textStyle),
                    const Spacer(),
                    _addButton(
                      onTap: controller.addAccount,
                    ),
                    const SizedBox(width: 8),
                  ],
                );
            }
          }),
        ),
      ),
      body: Obx(() => AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: controller.showingPage(),
          )),
      extendBody: true, //<-
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0) +
            const EdgeInsets.only(bottom: 20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: MyCard(
            color: Color.lerp(primaryColor, Colors.white, 0.1),
            shadowColor: Colors.black26,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            borderRadius: 12,
            child: Obx(
              () => Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: NavBarOptions.values
                    .map((index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () => controller.selectedIndex(index),
                            child: MyCard(
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.all(10),
                              color: controller.selectedIndex.value == index
                                  ? Colors.white
                                  : Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  controller.icon(index),
                                  size: 16,
                                  color: controller.selectedIndex.value != index
                                      ? Colors.white
                                      : primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _addButton({Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.transparent,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add", style: TextStyle(fontSize: 14)),
            SizedBox(width: 2),
            Icon(
              FontAwesomeIcons.plus,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
