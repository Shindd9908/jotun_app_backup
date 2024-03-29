import 'package:flutter/material.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/features/journey/presentation/ui/widgets/answer_widget.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/custom_flush_bar.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class AnswerQuestionScreen extends StatefulWidget {
  final AreaEntity area;

  const AnswerQuestionScreen({super.key, required this.area});

  @override
  State<AnswerQuestionScreen> createState() => _AnswerQuestionScreenState();
}

class _AnswerQuestionScreenState extends State<AnswerQuestionScreen> {
  List<bool> listAnswerSelected = [];

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Column(
        children: [
          Image.asset(
            AppAssets.imgLogoApp,
            width: AppHelper.setMultiDeviceSize(40.w, 40.w),
            fit: BoxFit.fitWidth,
          ),
          Expanded(
            child: PageView(
              children: List.generate(
                widget.area.questions!.length,
                (indexQuestion) => Column(
                  children: [
                    TextWidget(
                      text: widget.area.areaName != null ? widget.area.areaName!.toUpperCase() : '',
                      color: AppColor.colorMainWhite,
                      fontSize: AppHelper.setMultiDeviceSize(18.sp, 14.sp),
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    TextWidget(
                      text: widget.area.questions?[indexQuestion].title ?? '',
                      color: AppColor.colorMainWhite,
                      fontSize: AppHelper.setMultiDeviceSize(16.sp, 12.sp),
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(
                      widget.area.questions![indexQuestion].answers!.length,
                      (indexAnswer) => AnswerWidget(
                        answer: widget.area.questions![indexQuestion].answers![indexAnswer],
                        callbackSelectAnswer: (answerSelected) {
                          listAnswerSelected.add(answerSelected);
                          if(listAnswerSelected.length == widget.area.questions!.length && listAnswerSelected.indexWhere((el) => el == false) == -1) {
                            // Call api complete area
                          }
                          else {
                            Navigator.of(context).pop();
                            CustomFlushBar.showAlertFlushBar(context, 'abc');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
