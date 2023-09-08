import 'package:creditum/app/code/components/cicle_progress.dart';
import 'package:creditum/app/code/components/logo.dart';
import 'package:creditum/app/code/components/my_card.dart';
import 'package:creditum/app/code/components/title_balance.dart';
import 'package:creditum/app/code/components/transaction_tile.dart';
import 'package:creditum/app/code/values/colors.dart';
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
      ),
      body: const Dashboard(),
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
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () => controller.selectedIndex(index),
                      child: MyCard(
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.all(12),
                        color: controller.selectedIndex.value == index
                            ? Colors.white
                            : Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            controller.icon(index),
                            size: 20,
                            color: controller.selectedIndex.value != index
                                ? Colors.white
                                : primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
