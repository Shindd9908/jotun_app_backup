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
                padding: EdgeInsets.only(top: AppHelper.setMultiDeviceSize(context, 32, 32), bottom: AppHelper.setMultiDeviceSize(context, 24, 24)),
                child: Image.asset(AppAssets.imgLogoApp, width: AppHelper.setMultiDeviceSize(context, 32.w, 32.w)),
              ),
              TextWidget(
                text: S.of(context).congratulationsReceivingGiftJotun,
                color: AppColor.colorMainWhite,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Expanded(
                child: CacheImageWidget(
                  imageUrl: giftReceivedURL,
                  widthImage: 100.w - 64,
                  fit: BoxFit.fitHeight,
                  radius: 8,
                ),
              ),
              const SizedBox(height: 48),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: ButtonSubmitWidget(title: S.of(context).completedReceiveGift, widthButton: 60.w, textColor: AppColor.colorMainWhite),
              ),
              SizedBox(height: AppHelper.setMultiDeviceSize(context, 100, 100))
            ],
          ),
        ),
      ),
    );
  }
}
