import 'package:creditum/app/code/components/my_card.dart';
import 'package:creditum/app/code/components/transaction_tile.dart';
import 'package:creditum/app/code/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12) +
          const EdgeInsets.only(bottom: 82),
      children: [
        MyCard(
          padding: const EdgeInsets.all(36),
          color: primaryColor.withOpacity(0.7),
          child: const Column(
            children: [
              Text(
                "\$ 4,000.50",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
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
        Container(
          width: double.infinity,
          height: 0.1,
          color: Colors.black,
        ),
        const SizedBox(height: 10),
        const Text(
          "Shortcuts",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _shortCutButton(
              icon: FontAwesomeIcons.arrowRightArrowLeft,
              title: "Transfer",
            ),
            const SizedBox(width: 12),
            _shortCutButton(
              icon: FontAwesomeIcons.arrowRightToBracket,
              title: "Deposit",
              quarterTurns: 1,
            ),
            const SizedBox(width: 12),
            _shortCutButton(
              icon: FontAwesomeIcons.arrowRightFromBracket,
              title: "Withdraw",
              quarterTurns: -1,
            ),
            const SizedBox(width: 12),
            _shortCutButton(
              icon: FontAwesomeIcons.amazonPay,
              title: "Pay Bill",
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _shortCutButton(
              icon: FontAwesomeIcons.car,
              title: "Transportation",
            ),
            const SizedBox(width: 12),
            _shortCutButton(
              icon: FontAwesomeIcons.bowlFood,
              title: "Food & Drink",
            ),
            const SizedBox(width: 12),
            _shortCutButton(
              icon: FontAwesomeIcons.cartShopping,
              title: "Shopping",
            ),
            const SizedBox(width: 12),
            _shortCutButton(
              icon: FontAwesomeIcons.plusMinus,
              title: "Transaction",
            ),
          ],
        ),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,
          height: 0.1,
          color: Colors.black,
        ),
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

  Expanded _shortCutButton(
      {required IconData icon,
      required String title,
      Function()? onTap,
      int quarterTurns = 0}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            MyCard(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(0.1),
              padding: const EdgeInsets.all(20),
              shadowColor: Colors.transparent,
              child: RotatedBox(
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
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
