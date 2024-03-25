import 'package:flutter/material.dart';
import 'package:jotub_app/features/mini_game/presentation/ui/widgets/sample_board.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/custom_back_button.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class IntroduceMiniGame extends StatelessWidget {
  const IntroduceMiniGame({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          const CustomBackButton(),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Image.asset(
              AppAssets.imgLogoApp,
              width: 36.w,
            ),
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
          const SampleBoard(),
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
