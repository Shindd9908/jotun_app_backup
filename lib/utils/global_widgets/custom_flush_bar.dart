import "package:another_flushbar/flushbar.dart";
import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";

class CustomFlushBar {
  static void showAlertFlushBar(BuildContext context, String message, {bool? isSuccess}) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Flushbar(
        message: message,
        icon: Icon(isSuccess == true ? Icons.check_circle : Icons.warning, color: Colors.white, size: 30),
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        backgroundColor: isSuccess == true ? Colors.green : Colors.red,
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 2),
        borderRadius: BorderRadius.circular(8),
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(context);
    });
  }
}
