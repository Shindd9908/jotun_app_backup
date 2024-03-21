import 'package:flutter/material.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
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
          Column(
            children: [
              Image.asset(
                AppAssets.iconLock,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
