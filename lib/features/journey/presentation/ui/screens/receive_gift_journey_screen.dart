import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/cache_image_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class ReceiveGiftJourneyScreen extends StatelessWidget {
  final String giftReceivedURL;

  const ReceiveGiftJourneyScreen({super.key, required this.giftReceivedURL});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) => false,
      child: ScreenFrame(
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: AppHelper.setMultiDeviceSize(context, 70.h, 48.h),
                  bottom: AppHelper.setMultiDeviceSize(context, 40.h, 24.h),
                ),
                child: Image.asset(
                  AppAssets.imgLogoAppBackup,
                  width: AppHelper.setMultiDeviceSize(context, 744.w * 35 / 100, 393.w * 40 / 100),
                  fit: BoxFit.fitWidth,
                ),
              ),
              TextWidget(
                text: S.of(context).congratulationsReceivingGiftJotun,
                color: AppColor.colorMainWhite,
                fontSize: AppHelper.setMultiDeviceSize(context, 26.sp, 18.sp),
                fontWeight: FontWeight.w900,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48.h),
              Expanded(
                child: CacheImageWidget(
                  imageUrl: giftReceivedURL,
                  widthImage: AppHelper.setMultiDeviceSize(context, 744.w, 393.w) - 64.w,
                  fit: BoxFit.fitHeight,
                  radius: AppHelper.setMultiDeviceSize(context, 16, 8),
                ),
              ),
              SizedBox(height: 48.h),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: ButtonSubmitWidget(
                  title: S.of(context).completedReceiveGift,
                  widthButton: AppHelper.setMultiDeviceSize(context, 744.w * 52 / 100, 393.w * 76 / 100),
                  heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 70.h),
                  textColor: AppColor.colorMainWhite,
                ),
              ),
              SizedBox(height: AppHelper.setMultiDeviceSize(context, 100.h, 80.h))
            ],
          ),
        ),
      ),
    );
  }
}
