import 'package:creditum/app/core/values/colors.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  Rx<DateTime> fromDate = Rx(DateTime.now());
  Rx<DateTime> toDate = Rx(DateTime.now());

  void changeRange() {
    showCustomDateRangePicker(
      Get.context!,
      dismissible: true,
      minimumDate: DateTime.now().subtract(const Duration(days: 30)),
      maximumDate: DateTime.now().add(const Duration(days: 30)),
      endDate: toDate.value,
      startDate: fromDate.value,
      backgroundColor: Colors.white,
      primaryColor: primaryColor,
      onApplyClick: (start, end) {
        if (start != null && end != null) {
          fromDate.value = start;
          toDate.value = end;
        } else if (start != null || end != null) {
          fromDate.value = start ?? end ?? DateTime.now();
          toDate.value = start ?? end ?? DateTime.now();
        }
      },
      onCancelClick: () {},
    );
  }
}
