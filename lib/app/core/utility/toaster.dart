import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toaster {
  static showError(String message) {
    GetSnackBar snackBar = getSnackBar(
      message: message,
      title: "Error",
      color: const Color(0xffffa9ac),
      borderColor: const Color(0xfff43f45),
    );
    close();
    controller = Get.showSnackbar(snackBar);
  }

  static showSuccess(String message) {
    GetSnackBar snackBar = getSnackBar(
        message: message,
        title: "Success",
        color: const Color(0xffB9DBBD),
        borderColor: const Color(0xff9CC8A1));
    close();
    controller = Get.showSnackbar(snackBar);
  }

  static GetSnackBar getSnackBar({
    required String message,
    required String title,
    required Color color,
    required Color borderColor,
  }) {
    return GetSnackBar(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      snackStyle: SnackStyle.FLOATING,
      titleText: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: Get.back,
            child: const Icon(
              Icons.close,
              size: 18,
            ),
          )
        ],
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Color(0xff262626),
          fontSize: 14,
        ),
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      borderRadius: 12,
      margin: const EdgeInsets.all(12),
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 3),
      borderColor: borderColor,
      animationDuration: const Duration(milliseconds: 300),
      boxShadows: const [
        BoxShadow(
          blurRadius: 4,
          color: Colors.black12,
        ),
      ],
    );
  }

  static SnackbarController? controller;

  static close() {
    SnackbarController.closeCurrentSnackbar();
  }
}
