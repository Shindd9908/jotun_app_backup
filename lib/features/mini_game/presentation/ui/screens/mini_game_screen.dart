import 'package:flutter/material.dart';
import 'package:jotub_app/features/mini_game/presentation/ui/widgets/mini_game_board.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/custom_back_button.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class MiniGameScreen extends StatelessWidget {
  const MiniGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const CustomBackButton(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Image.asset(
              AppAssets.imgLogoApp,
              width: 36.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: TextWidget(
              text: S.of(context).exploreTheProductLine,
              fontSize: 16.sp,
              color: AppColor.colorMainYellow,
              fontWeight: FontWeight.w900,
            ),
          ),
          TextWidget(
            text: S.of(context).productName.toUpperCase(),
            color: AppColor.colorMainWhite,
            fontWeight: FontWeight.w900,
            fontSize: 19.sp,
            textAlign: TextAlign.center,
            height: 1.2,
          ),
          MiniGameBoard(),
        ],
      ),
    );
  }
}
