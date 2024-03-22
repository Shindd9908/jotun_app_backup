import 'package:flutter/material.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class IntroduceMiniGame extends StatelessWidget {
  const IntroduceMiniGame({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Image.asset(
            AppAssets.imgLogoApp,
            width: 36.w,
          ),
          TextWidget(
            text: S.of(context).gameRule,
            fontSize: 20.sp,
            color: AppColor.colorMainYellow,
          ),
          TextWidget(
            text: S.of(context).explainRule,
            fontSize: 12.sp,
            color: AppColor.colorMainWhite,
          ),
          ButtonSubmitWidget(
            title: S.of(context).startGame,
          ),
        ],
      ),
    );
  }
}
