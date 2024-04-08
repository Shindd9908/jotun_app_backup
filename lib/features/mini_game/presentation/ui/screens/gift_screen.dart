import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/mini_game/domain/entities/gift_entity.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/cache_image_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';

class GiftScreen extends StatelessWidget {
  const GiftScreen({Key? key, this.gift}) : super(key: key);

  final GiftEntity? gift;

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: gift != null
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: AppHelper.setMultiDeviceSize(context, 32, 32),
                    bottom: AppHelper.setMultiDeviceSize(context, 8, 8),
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      AppPaths.homeScreen,
                      (route) => false,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        AppAssets.iconArrowBack,
                        width: AppHelper.setMultiDeviceSize(context, 32, 32),
                        height: AppHelper.setMultiDeviceSize(context, 32, 32),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset(
                    AppAssets.imgLogoAppBackup,
                    width: 36.w,
                  ),
                ),
                TextWidget(
                  text: S.of(context).yourReward,
                  color: AppColor.colorMainYellow,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
                TextWidget(
                  text: gift!.content?.toUpperCase(),
                  color: AppColor.colorMainWhite,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        AppAssets.imgGift,
                      ),
                      Positioned(
                        bottom: 32,
                        child: CacheImageWidget(
                          imageUrl: gift!.giftUrl,
                          fit: BoxFit.fill,
                          widthImage: 160,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
              ],
            )
          : const SpinKitLoadingWidget(color: AppColor.colorMainWhite, size: 36),
    );
  }
}
