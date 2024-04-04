import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:jotub_app/features/journey/presentation/ui/widgets/journey_item.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/constants/constants.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/custom_flush_bar.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JourneyBloc>().add(FetchListAreaCompletedEvent());
    });
    super.initState();
  }

  List<AreaEntity> _listAllArea = [];
  List<AreaCompletedEntity> _listAreaCompleted = [];
  String _giftReceivedURL = '';

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      isHasButtonBack: true,
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: AppHelper.setMultiDeviceSize(context, 32, 32), bottom: AppHelper.setMultiDeviceSize(context, 36, 36)),
              child: Image.asset(AppAssets.imgLogoApp, width: AppHelper.setMultiDeviceSize(context, 32.w, 32.w)),
            ),
            Image.asset(AppAssets.imgBanner2, width: 100.w, fit: BoxFit.fitWidth),
            BlocConsumer<JourneyBloc, JourneyState>(
              listenWhen: (previous, current) =>
                  current is FetchListAreaCompletedLoadingState || current is FetchListAreaCompletedSuccessState || current is FetchListAreaCompletedFailState,
              listener: (context, state) {
                if (state is FetchListAreaCompletedSuccessState) {
                  _listAreaCompleted = state.listAreaCompleted;
                }
                context.read<JourneyBloc>().add(FetchListAreaEvent());
              },
              buildWhen: (previous, current) => current is FetchListAreaLoadingState || current is FetchListAreaSuccessState || current is FetchListAreaFailState,
              builder: (context, state) {
                if (state is FetchListAreaSuccessState) {
                  _listAllArea = state.listArea;
                }
                return Expanded(
                  child: Column(
                    children: [
                      if (state is FetchListAreaSuccessState && state.listArea.length == 4)
                        Expanded(
                          child: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            runAlignment: WrapAlignment.center,
                            children: List.generate(
                              _listAllArea.length,
                              (index) => SizedBox(
                                width: (100.w - 44) / 2,
                                height: ((100.w - 44) / 2) / 1.5,
                                child: JourneyItem(
                                  area: _listAllArea[index],
                                  isUnlock: _listAreaCompleted.isNotEmpty && _listAreaCompleted.indexWhere((el) => el.areaId == _listAllArea[index].areaId) != -1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (state is FetchListAreaSuccessState && state.listArea.length < 4)
                        Container(
                          alignment: Alignment.center,
                          width: 100.w,
                          height: AppHelper.setMultiDeviceSize(context, 150, 150),
                          child: TextWidget(
                            text: S.of(context).noData,
                            color: AppColor.colorMainWhite,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      if (state is FetchListAreaLoadingState)
                        Container(
                          alignment: Alignment.center,
                          width: 100.w,
                          height: AppHelper.setMultiDeviceSize(context, 150, 150),
                          child: const SpinKitLoadingWidget(color: AppColor.colorMainWhite, size: 34),
                        ),
                      Padding(
                        padding: EdgeInsets.only(bottom: AppHelper.setMultiDeviceSize(context, 16, 16)),
                        child: BlocConsumer<JourneyBloc, JourneyState>(
                            listenWhen: (previous, current) =>
                                current is FetchListGiftSuccessState || current is FetchListGiftFailState || current is ReceiveGiftSuccessState || current is ReceiveGiftFailState,
                            listener: (context, state) {
                              if (state is FetchListGiftSuccessState) {
                                if (state.listGift.indexWhere((el) => el.type == Constants.typeGiftJourney) != -1) {
                                  context.read<JourneyBloc>().add(
                                      ReceiveGiftEvent(giftId: state.listGift.firstWhere((el) => el.type == Constants.typeGiftJourney).giftId!, type: Constants.typeGiftJourney));
                                  _giftReceivedURL = state.listGift.firstWhere((el) => el.type == Constants.typeGiftJourney).giftURL ?? '';
                                }
                              }
                              if (state is FetchListGiftFailState) {
                                CustomFlushBar.showAlertFlushBar(context, state.message);
                              }
                              if (state is ReceiveGiftSuccessState) {
                                Navigator.of(context).pushNamed(AppPaths.receiveGiftJourneyScreen, arguments: {'giftReceivedURL': _giftReceivedURL});
                              }
                              if (state is ReceiveGiftFailState) {
                                CustomFlushBar.showAlertFlushBar(context, state.message);
                              }
                            },
                            buildWhen: (previous, current) =>
                                current is FetchListGiftSuccessState ||
                                current is FetchListGiftFailState ||
                                current is FetchListGiftLoadingState ||
                                current is ReceiveGiftSuccessState ||
                                current is ReceiveGiftFailState ||
                                current is ReceiveGiftLoadingState,
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  if (state is! FetchListGiftLoadingState &&
                                      state is! FetchListGiftSuccessState &&
                                      state is! ReceiveGiftLoadingState &&
                                      _listAreaCompleted.length == _listAllArea.length) {
                                    context.read<JourneyBloc>().add(const FetchListGiftEvent(type: Constants.typeGiftJourney));
                                  }
                                },
                                child: ButtonSubmitWidget(
                                  title: S.of(context).claimRewardButton,
                                  widthButton: 60.w,
                                  textColor: _listAreaCompleted.length == _listAllArea.length ? AppColor.colorMainWhite : AppColor.colorMainGray,
                                  isShowLoading: state is FetchListGiftLoadingState || state is FetchListGiftSuccessState || state is ReceiveGiftLoadingState,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              },
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
    );
  }
}
