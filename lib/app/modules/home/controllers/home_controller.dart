import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  IconData? icon(int index) {
    switch (index) {
      case 0:
        return FontAwesomeIcons.houseChimney;
      case 1:
        return FontAwesomeIcons.chartLine;
      case 2:
        return FontAwesomeIcons.listUl;
      case 3:
        return FontAwesomeIcons.solidCreditCard;
      case 4:
        return FontAwesomeIcons.home;
    }
  }
}
