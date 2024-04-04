import "package:another_flushbar/flushbar.dart";
import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:jotub_app/utils/helpers/helpers.dart";

class CustomFlushBar {
  static void showAlertFlushBar(BuildContext context, String message, {bool? isSuccess}) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Flushbar(
        message: message,
        messageSize: AppHelper.setMultiDeviceSize(context, 22.sp, 16.sp),
        icon: Icon(
          isSuccess == true ? Icons.check_circle : Icons.warning,
          color: Colors.white,
          size: AppHelper.setMultiDeviceSize(context, 36.w, 30.w),
        ),
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        backgroundColor: isSuccess == true ? Colors.green : Colors.red,
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 2),
        borderRadius: BorderRadius.circular(8),
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(context);
    });
  }
}
