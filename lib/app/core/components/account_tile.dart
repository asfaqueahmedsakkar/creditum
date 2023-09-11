import 'package:creditum/app/core/components/my_card.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:flutter/material.dart';

class AccountTile extends StatelessWidget {
  final AccountType accountType;

  const AccountTile({
    super.key,
    required this.accountType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: MyCard(
        color: getColor(),
        child: Column(
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Asfaque Ahmed",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Test account name",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Balance",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "\$ 1,220",
                      style: TextStyle(
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
                      "${accountType.name[0].toUpperCase()}${accountType.name.substring(1).replaceAll("_", " ")}",
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "####",
                      style: TextStyle(
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
