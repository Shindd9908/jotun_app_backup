import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotub_app/features/mini_game/presentation/bloc/mini_game_bloc.dart';
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
import 'package:sizer/sizer.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({Key? key}) : super(key: key);

  @override
  State<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MiniGameBloc>().add(const FetchGiftEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 12),
            child: Image.asset(
              AppAssets.imgLogoApp,
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
          BlocBuilder<MiniGameBloc, MiniGameState>(
            buildWhen: (_, current) => current is FetchGiftLoadingState || current is FetchGiftSuccessState,
            builder: (context, state) {
              if (state is FetchGiftSuccessState) {
                return TextWidget(
                  text: state.gift.content?.toUpperCase(),
                  color: AppColor.colorMainWhite,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                );
              }
              return SpinKitLoadingWidget(
                size: AppHelper.setMultiDeviceSize(20.sp, 16.sp),
                color: AppColor.colorMainWhite,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  AppAssets.imgGift,
                ),
                BlocBuilder<MiniGameBloc, MiniGameState>(
                  buildWhen: (_, current) => current is FetchGiftLoadingState || current is FetchGiftSuccessState,
                  builder: (context, state) {
                    if (state is FetchGiftSuccessState) {
                      return Positioned(
                        bottom: 32,
                        child: CacheImageWidget(
                          imageUrl: state.gift.giftUrl,
                          fit: BoxFit.fill,
                          widthImage: 160,
                        ),
                      );
                    }
                    return Container();
                  },
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
      ),
    );
  }
}
