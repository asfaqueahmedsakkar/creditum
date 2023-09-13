import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AmountInputArea extends StatelessWidget {
  final AmountInputAreaController controller;

  const AmountInputArea({super.key, required this.controller});

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
              "\$${controller.amount.isEmpty ? "0" : controller.amount}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: controller.amount.isEmpty ? Colors.grey : Colors.black,
              ),
              minFontSize: 12,
              maxFontSize: 52,
            )),
      ),
    );
  }

  void _showKeyPad() {
    Get.bottomSheet(
      KeyPad(controller: controller),
      barrierColor: Colors.black.withOpacity(0.075),
    );
  }
}

class AmountInputAreaController {
  String get amount => _amount.value;
  final RxString _amount = "".obs;

  add(String s) => amount.isNotEmpty && int.parse(amount) == 0
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
