import "package:another_flushbar/flushbar.dart";
import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class CustomFlushBar {
  static void showFailed(BuildContext context, String message) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Flushbar(
        message: message,
        icon: Icon(
          Icons.warning,
          color: Colors.white,
          size: 30.sp,
        ),
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        backgroundColor: Colors.red,
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 2),
        borderRadius: BorderRadius.circular(8),
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(context);
    });
  }
}
