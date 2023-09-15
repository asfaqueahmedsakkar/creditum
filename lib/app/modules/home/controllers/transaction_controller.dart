import 'package:creditum/app/core/controller/app_controller.dart';
import 'package:creditum/app/core/values/colors.dart';
import 'package:creditum/app/data/models/transaction.dart';
import 'package:creditum/app/data/services/transaction_service.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class TransactionController extends GetxController {
  Rx<DateTime> fromDate = Rx(DateTime.now());
  Rx<DateTime> toDate = Rx(DateTime.now());
  Rx<List<TransactionModel>?> transactions = Rx(null);

  @override
  void onReady() {
    super.onReady();
    _loadTransactions();
  }

  _loadTransactions() {
    TransactionService()
        .getTransactions(
          Get.find<AppController>().userId!,
          fromDate: fromDate.value,
          toDate: toDate.value,
        )
        .then((value) => transactions.value = value);
  }

  addTransaction(TransactionModel accountModel) async {
    await TransactionService().addTransactions(accountModel).then((value) {
      transactions.update((val) {
        val!.add(value);
        transactions.value = val;
      });
    });
  }

  void changeRange() async {
    List<DateTime>? dateTimeList = await showOmniDateTimeRangePicker(
      type: OmniDateTimePickerType.date,
      context: Get.context!,
      startInitialDate: fromDate.value,
      endInitialDate: toDate.value,
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
    );
    if (dateTimeList != null && dateTimeList.length == 2) {
      fromDate.value = dateTimeList[0];
      toDate.value = dateTimeList[1];
    }
  }
}
