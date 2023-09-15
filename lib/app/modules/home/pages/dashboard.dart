import 'package:creditum/app/core/components/my_card.dart';
import 'package:creditum/app/core/components/transaction_tile.dart';
import 'package:creditum/app/core/extensions/string_extenstion.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:creditum/app/modules/home/controllers/account_controller.dart';
import 'package:creditum/app/modules/home/controllers/category_controller.dart';
import 'package:creditum/app/modules/home/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Dashboard extends GetView<DashboardController> {
  final CategoryController categoryController = Get.find<CategoryController>();
  final AccountController accountController = Get.find<AccountController>();

  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12) +
          const EdgeInsets.only(bottom: 82),
      children: [
        MyCard(
          padding: const EdgeInsets.all(36),
          color: primaryColor.withOpacity(0.7),
          child: Column(
            children: [
              Obx(
                () => Text(
                  "\$ ${controller.balance.value!.currencyConvertor()}",
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Available Balance",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        _divider(),
        _shortcuts(),
        _divider(),
        const SizedBox(height: 10),
        const Text(
          "Recent Activity",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const TransactionTile(),
        const TransactionTile(),
        const TransactionTile(),
        const TransactionTile(),
        const TransactionTile(),
      ],
    );
  }

  Container _divider() {
    return Container(
      width: double.infinity,
      height: 0.1,
      color: Colors.black,
    );
  }

  Widget _shortcuts() {
    return Obx(
      () {
        if (categoryController.categories.value == null) {
          return const SizedBox();
        }

        List<Widget> items = [
          if ((accountController.accounts.value?.length ?? 0) > 1)
            _shortCutButton(
              icon: FontAwesomeIcons.arrowRightArrowLeft,
              title: "Transfer",
            ),
          _shortCutButton(
            icon: FontAwesomeIcons.arrowRightToBracket,
            title: "Deposit",
            quarterTurns: 1,
          ),
          if ((accountController.accounts.value?.length ?? 0) > 1)
            _shortCutButton(
              icon: FontAwesomeIcons.arrowRightFromBracket,
              title: "Withdraw",
              quarterTurns: -1,
            ),
          _shortCutButton(
            title: categoryController.categories.value![0].name!,
          ),
          _shortCutButton(
            title: categoryController.categories.value![1].name!,
          ),
          _shortCutButton(
            title: categoryController.categories.value![2].name!,
          ),
          _shortCutButton(
            title: categoryController.categories.value![3].name!,
          ),
          if ((accountController.accounts.value?.length ?? 0) <= 1)
            _shortCutButton(
              title: categoryController.categories.value![4].name!,
            ),
          if ((accountController.accounts.value?.length ?? 0) <= 1)
            _shortCutButton(
              title: categoryController.categories.value![5].name!,
            ),
          _shortCutButton(
            icon: FontAwesomeIcons.plusMinus,
            title: "Transaction",
          ),
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 4.0),
              child: Text(
                "Shortcuts",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ...List.generate(
                2,
                (index) => Column(
                      children: [
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            items[index * 4],
                            const SizedBox(width: 12),
                            items[index * 4 + 1],
                            const SizedBox(width: 12),
                            items[index * 4 + 2],
                            const SizedBox(width: 12),
                            items[index * 4 + 3],
                          ],
                        )
                      ],
                    )),
            const SizedBox(height: 18),
          ],
        );
      },
    );
  }

  Expanded _shortCutButton({
    IconData? icon,
    required String title,
    Function()? onTap,
    int quarterTurns = 0,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            MyCard(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(0.1),
              padding: EdgeInsets.all(icon == null ? 16 : 20),
              shadowColor: Colors.transparent,
              child: icon == null
                  ? Image.asset(
                      "assets/cat_icon/${title.toLowerCase()}.png",
                      height: 28,
                      color: primaryColor,
                    )
                  : RotatedBox(
                      quarterTurns: quarterTurns,
                      child: Icon(
                        icon,
                        size: 20,
                        color: primaryColor,
                      ),
                    ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
