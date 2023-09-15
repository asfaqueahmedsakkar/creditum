import 'package:creditum/app/core/components/my_card.dart';
import 'package:creditum/app/core/extensions/string_extenstion.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:flutter/material.dart';

class AccountTile extends StatelessWidget {
  final AccountType accountType;

  final String title;

  final String balance;

  final String identifier;

  const AccountTile({
    super.key,
    required this.accountType,
    required this.title,
    required this.balance,
    required this.identifier,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: MyCard(
        color: getColor(),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Asfaque Ahmed",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Balance",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "\$${balance.currencyConvertor()}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/accounts/${accountType.name}.png",
                  height: 32,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${accountType.name.toCamellaCase()}",
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      identifier,
                      style: const TextStyle(
                          fontSize: 16, color: Colors.white, letterSpacing: 1),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  getColor() {
    switch (accountType) {
      case AccountType.cash:
        return successColor;
      case AccountType.mobile_banking:
        return primaryColor;
      case AccountType.card:
        return failedColor;
      case AccountType.none:
        return Colors.grey;
    }
  }
}
