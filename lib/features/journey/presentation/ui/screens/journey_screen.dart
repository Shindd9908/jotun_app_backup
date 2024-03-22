import 'package:flutter/material.dart';
import 'package:jotub_app/features/journey/presentation/ui/widgets/journey_item.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class JourneyScreen extends StatelessWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
            ),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  AppAssets.iconArrowBack,
                  width: 8.w,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 4.h,
              bottom: 4.h,
            ),
            child: Image.asset(
              AppAssets.imgLogoApp,
              width: 32.w,
            ),
          ),
          Image.asset(
            AppAssets.imgBanner2,
          ),
          Expanded(
            child: Center(
              child: TextWidget(
                text: S.of(context).explainJourney,
                color: AppColor.colorMainYellow,
                fontSize: 11.sp,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Wrap(
            children: [
              JourneyItem(),
              JourneyItem(unlock: false),
              JourneyItem(unlock: false),
              JourneyItem(unlock: false),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextWidget(
              text: S.of(context).explainClaimReward1,
              color: AppColor.colorMainWhite,
              fontSize: 14.sp,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextWidget(
                text: S.of(context).fourAreas,
                color: AppColor.colorMainYellow,
                fontSize: 16.sp,
              ),
              TextWidget(
                text: ' ${S.of(context).explainClaimReward2}',
                color: AppColor.colorMainWhite,
                fontSize: 14.sp,
                height: 1.55,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ButtonSubmitWidget(
              title: S.of(context).claimRewardButton,
              widthButton: 60.w,
              textColor: AppColor.colorMainGray,
            ),
          ),
        ],
      ),
    );
  }
}
