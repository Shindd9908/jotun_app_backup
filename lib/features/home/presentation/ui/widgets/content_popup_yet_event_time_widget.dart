import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class ContentPopupYetEventTimeWidget extends StatelessWidget {
  const ContentPopupYetEventTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppHelper.setMultiDeviceSize(context, 16.h, 16.h),
        left: AppHelper.setMultiDeviceSize(context, 32.w, 16.w),
        right: AppHelper.setMultiDeviceSize(context, 32.w, 16.w),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(
            text: S.of(context).contentPopupWelcomeNewProducts,
            color: AppColor.colorMainBlack,
            fontSize: AppHelper.setMultiDeviceSize(context, 24.sp, 16.sp),
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppHelper.setMultiDeviceSize(context, 16.h, 8.h),
              horizontal: AppHelper.setMultiDeviceSize(context, 74.w, 40.w),
            ),
            child: const Divider(height: 1, color: AppColor.colorMainBlack),
          ),
          TextWidget(
            text: S.of(context).dateNewProductLaunched,
            color: AppColor.colorMainYellow,
            fontSize: AppHelper.setMultiDeviceSize(context, 28.sp, 18.sp),
            fontWeight: FontWeight.w900,
          ),
        ],
      ),
    );
  }
}
