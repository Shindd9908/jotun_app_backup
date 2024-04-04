import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class PopupDialogAlert {
  static Future<void> showPopupWithUIParamFullScreen(BuildContext context, Widget uiContent) async {
    await showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: uiContent,
            ),
          ),
        );
      },
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
    );
  }

  static Future<void> showPopupWithUIParam(BuildContext context, Widget uiContent) async {
    await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) => AlertDialog(
        insetPadding: const EdgeInsets.all(6),
        contentPadding: const EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.all(16),
          constraints: BoxConstraints(maxHeight: 852.h * 1 / 2, minHeight: 852.h * 16 / 100),
          width: AppHelper.setMultiDeviceSize(context, 744.w * 60 / 100, 393.w * 84 / 100),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: uiContent,
        ),
      ),
    );
  }

  static Future<void> showPopupWithUIParamHasBell(BuildContext context, Widget uiContent) async {
    await showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Container(
                width: AppHelper.setMultiDeviceSize(context, 744.w * 64 / 100, 393.w - 64),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColor.colorMainWhite,
                  borderRadius: BorderRadius.circular(
                    AppHelper.setMultiDeviceSize(context, 32, 16),
                  ),
                ),
                child: Stack(
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(0, AppHelper.setMultiDeviceSize(context, -64, -34), 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: AppHelper.setMultiDeviceSize(context, 80.w, 60.w),
                            height: AppHelper.setMultiDeviceSize(context, 80.w, 60.w),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColor.colorMainWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(AppAssets.iconBellNotification, fit: BoxFit.fill),
                            ),
                          ),
                          uiContent,
                        ],
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: 4,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.clear, size: AppHelper.setMultiDeviceSize(context, 36.w, 24.w)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
    );
  }
}
