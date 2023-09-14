import 'package:auto_size_text/auto_size_text.dart';
import 'package:creditum/app/core/extensions/string_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AmountInputArea extends StatefulWidget {
  final AmountInputAreaController controller;

  const AmountInputArea({super.key, required this.controller});

  @override
  State<AmountInputArea> createState() => _AmountInputAreaState();
}

class _AmountInputAreaState extends State<AmountInputArea> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), _showKeyPad);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showKeyPad,
      child: Container(
        height: 150,
        alignment: Alignment.center,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Obx(() => AutoSizeText(
              "\$${widget.controller.amount.isEmpty ? "0" : widget.controller.amount.toString().currencyConvertor()}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.w500,
                color: widget.controller.amount.isEmpty
                    ? Colors.grey
                    : Colors.black,
              ),
              maxLines: 1,
              minFontSize: 12,
              maxFontSize: 52,
            )),
      ),
    );
  }

  void _showKeyPad() {
    Get.bottomSheet(
      KeyPad(controller: widget.controller),
      barrierColor: Colors.black.withOpacity(0.075),
    );
  }
}

class AmountInputAreaController {
  String get amount => _amount.value;
  final RxString _amount = "".obs;

  add(String s) => amount.length == 16
      ? _amount.value = amount
      : amount.isNotEmpty && amount == "0"
          ? _amount.value = s
          : _amount.value = "$amount$s";

  backSpace() => amount.isEmpty
      ? _amount.value = ""
      : _amount.value = amount.substring(0, amount.length - 1);

  void clear() => _amount.value = "";
}

class KeyPad extends StatefulWidget {
  final AmountInputAreaController controller;

  const KeyPad({super.key, required this.controller});

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  late List<List<dynamic>> keys;

  @override
  void initState() {
    keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      [
        RawMaterialButton(
          onPressed: () {
            widget.controller.backSpace();
          },
          onLongPress: () {
            widget.controller.clear();
          },
          child: const Center(
            child: Icon(
              FontAwesomeIcons.deleteLeft,
              color: Colors.black,
            ),
          ),
        ),
        '0',
        RawMaterialButton(
          onPressed: () {
            Get.back();
          },
          child: const Center(
            child: Icon(
              FontAwesomeIcons.check,
              color: Colors.black,
            ),
          ),
        )
      ],
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: keys
            .map(
              (e) => Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: e
                      .map(
                        (e) => AspectRatio(
                          aspectRatio: 1,
                          child: RawMaterialButton(
                            child: Container(
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: e is String
                                  ? Text(
                                      e,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  : e as Widget,
                            ),
                            onPressed: () {
                              widget.controller.add(e);
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
