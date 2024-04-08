import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:jotub_app/features/journey/presentation/ui/widgets/answer_widget.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/custom_flush_bar.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class AnswerQuestionScreen extends StatefulWidget {
  final AreaEntity area;

  const AnswerQuestionScreen({super.key, required this.area});

  @override
  State<AnswerQuestionScreen> createState() => _AnswerQuestionScreenState();
}

class _AnswerQuestionScreenState extends State<AnswerQuestionScreen> {
  final PageController _pageController = PageController();

  final List<bool> _listAnswerSelected = [];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) => false,
      child: ScreenFrame(
        child: Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppHelper.setMultiDeviceSize(context, 60.h, 46.h),
              left: AppHelper.setMultiDeviceSize(context, 744.w / 12 + 48.w, 32.w),
              right: AppHelper.setMultiDeviceSize(context, 744.w / 12 + 48.w, 32.w),
            ),
            child: Column(
              children: [
                Image.asset(
                  AppAssets.imgLogoAppBackup,
                  width: AppHelper.setMultiDeviceSize(context, 744.w * 35 / 100, 393.w * 40 / 100),
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(context, 60.h, 46.h)),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      widget.area.questions!.length,
                      (index) => Column(
                        children: [
                          TextWidget(
                            text: widget.area.areaName != null ? widget.area.areaName!.toUpperCase() : '',
                            color: AppColor.colorMainWhite,
                            fontSize: AppHelper.setMultiDeviceSize(context, 26.sp, 18.sp),
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 6.h),
                          TextWidget(
                            text: widget.area.questions?[index].title ?? '',
                            color: AppColor.colorMainWhite,
                            fontSize: AppHelper.setMultiDeviceSize(context, 20.sp, 14.sp),
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 24.h),
                          AnswerWidget(
                            listAnswer: widget.area.questions![index].answers!,
                            callbackSelectAnswer: (answerSelected) => _listAnswerSelected.add(answerSelected),
                          ),
                          SizedBox(height: AppHelper.setMultiDeviceSize(context, 20.h, 14.h)),
                          BlocConsumer<JourneyBloc, JourneyState>(
                            listenWhen: (previous, current) => current is CompleteAreaSuccessState || current is CompleteAreaFailState,
                            listener: (context, state) {
                              if (state is CompleteAreaSuccessState) {
                                context.read<JourneyBloc>().add(FetchListAreaCompletedEvent());
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                CustomFlushBar.showAlertFlushBar(context, state.message, isSuccess: true);
                              }
                              if (state is CompleteAreaFailState) {
                                CustomFlushBar.showAlertFlushBar(context, state.message);
                              }
                            },
                            buildWhen: (previous, current) =>
                                current is CompleteAreaLoadingState || current is CompleteAreaSuccessState || current is CompleteAreaFailState,
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  if (_pageController.page! < widget.area.questions!.length - 1) {
                                    _pageController.animateToPage(_pageController.page!.toInt() + 1,
                                        duration: const Duration(milliseconds: 500), curve: Curves.ease);
                                  } else {
                                    if (_listAnswerSelected.length == widget.area.questions!.length &&
                                        _listAnswerSelected.indexWhere((el) => el == false) == -1) {
                                      context.read<JourneyBloc>().add(CompleteAreaEvent(areaId: widget.area.areaId!));
                                    } else {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      CustomFlushBar.showAlertFlushBar(context, S.of(context).alertAnswerWrong);
                                    }
                                  }
                                },
                                child: ButtonSubmitWidget(
                                  title: S.of(context).titleButtonNextQuestion,
                                  widthButton: AppHelper.setMultiDeviceSize(context, 744.w * 52 / 100, 393.w * 76 / 100),
                                  heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 70.h),
                                  isShowLoading: state is CompleteAreaLoadingState,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
