import 'package:creditum/app/core/components/my_card.dart';
import 'package:creditum/app/core/extensions/date_extension.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: MyCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shadowColor: Colors.black.withOpacity(0.05),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateTime.now().toDateTimeString(),
                    style:  TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w700,color: primaryColor),
                  ),
                  const Text(
                    "Rickshaw vara",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Transportation",
                    style: TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              )),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Card",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "- \$ 120",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
