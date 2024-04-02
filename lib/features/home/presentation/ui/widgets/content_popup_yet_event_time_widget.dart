import 'package:flutter/material.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class ContentPopupYetEventTimeWidget extends StatelessWidget {
  const ContentPopupYetEventTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        TextWidget(
          text: S.of(context).contentPopupWelcomeNewProducts,
          color: AppColor.colorMainBlack,
          fontSize: AppHelper.setMultiDeviceSize(18.sp, 14.sp),
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: AppHelper.setMultiDeviceSize(10.w, 10.w)),
          child: const Divider(height: 1, color: AppColor.colorMainBlack),
        ),
        TextWidget(
          text: S.of(context).dateNewProductLaunched,
          color: AppColor.colorMainYellow,
          fontSize: AppHelper.setMultiDeviceSize(20.sp, 16.sp),
          fontWeight: FontWeight.w900,
        ),
      ],
    );
  }
}
