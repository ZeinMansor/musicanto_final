import 'package:flutter/material.dart';
import 'package:get/get.dart';

successSnakbar() {
  return Get.snackbar("Successfully", "The addition was successful",
      icon: const Icon(
        color: Colors.green,
        Icons.task_alt_outlined,
        size: 40,
      ),
      snackPosition: SnackPosition.BOTTOM);
}

errorSnakbar() {
  Get.snackbar("Error", "The addition was failed",
      icon: const Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 40,
      ),
      snackPosition: SnackPosition.BOTTOM);
}
