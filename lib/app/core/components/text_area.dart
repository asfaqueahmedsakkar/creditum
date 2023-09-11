import 'package:creditum/app/core/components/input_container.dart';
import 'package:creditum/app/core/utility/text_formatter.dart';
import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final String? label;
  final String? error;
  final TextEditingController controller;
  final String? hint;
  final TextInputType? textInputType;
  final bool? enabled;
  final bool singleLine;
  final List<TextFormatter>? allowedFormatter;

  final Widget? prefix;
  final Widget? suffix;

  final bool obscure;

  const TextArea({
    Key? key,
    this.label,
    this.error,
    required this.controller,
    this.hint,
    this.textInputType,
    this.enabled,
    this.singleLine = true,
    this.allowedFormatter,
    this.prefix,
    this.suffix,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      label: label,
      error: error,
      disablePadding: true,
      enabled: enabled ?? true,
      child: Row(
        children: [
          if (prefix != null)
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: prefix,
            ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey[300]),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 8,
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 0.2,
              ),
              obscureText: obscure,
              maxLines: singleLine ? 1 : 8,
              minLines: singleLine ? null : 4,
              keyboardType: textInputType,
              inputFormatters:
                  allowedFormatter?.map((e) => e.formatter).toList(),
            ),
          ),
          if (suffix != null)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: suffix,
            ),
        ],
      ),
    );
  }
}
