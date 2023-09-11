import 'package:flutter/material.dart';

class SelectableItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool isSelected;

  final Function() onTap;

  const SelectableItem({
    super.key,
    required this.title,
    this.subTitle,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
              width: 0.2, color: isSelected ? Colors.green : Colors.grey),
          color: isSelected ? Colors.green.withOpacity(0.01) : Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.transparent,
                  border: Border.all(width: 0.2),
                  shape: BoxShape.circle,
                ),
                height: 18,
                width: 18,
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14),
                  ),
                  if (subTitle != null)
                    const Text(
                      "16 july, 2023 | 2,664 KB",
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                      maxLines: 1,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
