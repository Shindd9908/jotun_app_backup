import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotub_app/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:jotub_app/features/journey/presentation/ui/widgets/journey_item.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JourneyBloc>().add(FetchListAreaEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      isHasButtonBack: true,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: AppHelper.setMultiDeviceSize(32, 32), bottom: AppHelper.setMultiDeviceSize(36, 36)),
                child: Image.asset(AppAssets.imgLogoApp, width: AppHelper.setMultiDeviceSize(32.w, 32.w)),
              ),
              Image.asset(AppAssets.imgBanner2, width: 100.w, fit: BoxFit.fitWidth),
              SizedBox(height: AppHelper.setMultiDeviceSize(10.h, 10.h)),
              BlocBuilder<JourneyBloc, JourneyState>(
                buildWhen: (previous, current) =>
                    current is FetchListAreaLoadingState || current is FetchListAreaSuccessState || current is FetchListAreaFailState,
                builder: (context, state) {
                  return state is FetchListAreaSuccessState
                      ? state.listArea.length == 4
                          ? SizedBox(
                              width: 100.w,
                              height: AppHelper.setMultiDeviceSize(30.h, 30.h),
                              child: GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                childAspectRatio: 1.4,
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                children: List.generate(state.listArea.length, (index) => JourneyItem(area: state.listArea[index])),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              width: 100.w,
                              height: AppHelper.setMultiDeviceSize(150, 150),
                              child: TextWidget(
                                text: S.of(context).noData,
                                color: AppColor.colorMainWhite,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                      : Container(
                          alignment: Alignment.center,
                          width: 100.w,
                          height: AppHelper.setMultiDeviceSize(150, 150),
                          child: const SpinKitLoadingWidget(color: AppColor.colorMainWhite, size: 34),
                        );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: AppHelper.setMultiDeviceSize(48, 48), bottom: AppHelper.setMultiDeviceSize(16, 16)),
                child: ButtonSubmitWidget(
                  title: S.of(context).claimRewardButton,
                  widthButton: 60.w,
                  textColor: AppColor.colorMainGray,
                ),
              ),
              TextWidget(
                text: S.of(context).explainClaimReward1,
                color: AppColor.colorMainWhite,
                fontSize: 14.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWidget(
                    text: S.of(context).fourAreas,
                    color: AppColor.colorMainYellow,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  TextWidget(
                    text: ' ${S.of(context).explainClaimReward2}',
                    color: AppColor.colorMainWhite,
                    fontSize: 14.sp,
                    height: 1.55,
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
