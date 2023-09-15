import 'package:creditum/app/core/components/empty.dart';
import 'package:creditum/app/core/components/loading.dart';
import 'package:creditum/app/core/components/my_card.dart';
import 'package:creditum/app/core/components/transaction_tile.dart';
import 'package:creditum/app/core/extensions/date_extension.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:creditum/app/data/models/transaction.dart';
import 'package:creditum/app/modules/home/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Transactions extends GetView<TransactionController> {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 8),
          child: Obx(
            () => Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: controller.changeRange,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Transaction overview",
                            style: TextStyle(fontSize: 11),
                          ),
                          Row(
                            children: [
                              Text(
                                "${controller.fromDate.value.toDateString()}${controller.fromDate.value.isSameDay(controller.toDate.value) ? "" : " - ${controller.toDate.value.toDateString()}"}",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.arrow_drop_down_rounded)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  "\$ 1,400",
                  style: TextStyle(
                      fontSize: 16,
                      color: failedColor,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => controller.transactions.value == null
                ? const Loading()
                : controller.transactions.value!.isEmpty
                    ? const Empty()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8) +
                            const EdgeInsets.only(bottom: 82),
                        itemBuilder: (BuildContext context, int index) {
                          TransactionModel transaction =
                              controller.transactions.value![index];
                          return const TransactionTile(

                          );
                        },
                        itemCount: controller.transactions.value!.length,
                      ),
          ),
        ),
      ],
    );
  }
}
