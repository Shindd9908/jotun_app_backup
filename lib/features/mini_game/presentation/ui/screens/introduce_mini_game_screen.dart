import 'package:flutter/material.dart';
import 'package:jotub_app/features/mini_game/presentation/ui/widgets/sample_board.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class IntroduceMiniGameScreen extends StatelessWidget {
  const IntroduceMiniGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppHelper.setMultiDeviceSize(32, 32),
              bottom: AppHelper.setMultiDeviceSize(36, 36),
            ),
            child: GestureDetector(
              onTap: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pushNamedAndRemoveUntil(AppPaths.homeScreen, (route) => false);
                }
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  AppAssets.iconArrowBack,
                  width: AppHelper.setMultiDeviceSize(32, 32),
                  height: AppHelper.setMultiDeviceSize(32, 32),
                ),
              ),
            ),
          ),
          Image.asset(
            AppAssets.imgLogoApp,
            width: 36.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextWidget(
              text: S.of(context).gameRule,
              fontSize: 20.sp,
              color: AppColor.colorMainYellow,
              fontWeight: FontWeight.w900,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: const SampleBoard(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: TextWidget(
              text: S.of(context).explainRule,
              fontSize: 13.sp,
              color: AppColor.colorMainWhite,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(AppPaths.miniGameScreen),
            child: ButtonSubmitWidget(
              title: S.of(context).startGame,
              widthButton: 60.w,
            ),
          ),
        ],
      ),
    );
  }
}
