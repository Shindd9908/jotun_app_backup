import 'package:flutter/material.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, this.isCompleted}) : super(key: key);

  final bool? isCompleted;

  @override
  Widget build(BuildContext context) {
    final bool isCompletedMiniGame = isCompleted != null ? isCompleted! : false;
    return ScreenFrame(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 48),
            child: Image.asset(
              AppAssets.imgLogoApp,
              width: 36.w,
            ),
          ),
          TextWidget(
            text: isCompletedMiniGame == true ? S.of(context).completedMiniGame.toUpperCase() : S.of(context).uncompletedMiniGame.toUpperCase(),
            color: AppColor.colorMainYellow,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextWidget(
              text: S.of(context).youHaveReceivedTheGift,
              color: isCompletedMiniGame == true ? AppColor.colorMainWhite : AppColor.colorTransparent,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 32),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                AppPaths.introduceMiniGameScreen,
                (route) => false,
              ),
              child: ButtonSubmitWidget(
                title: S.of(context).playAgain,
                widthButton: 72.w,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
              AppPaths.homeScreen,
              (route) => false,
            ),
            child: ButtonSubmitWidget(
              title: S.of(context).backToHome,
              widthButton: 72.w,
            ),
          ),
          if (isCompletedMiniGame == true)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: TextWidget(
                text: S.of(context).timeToReceiveGift,
                color: AppColor.colorMainWhite,
                fontSize: 10.sp,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
