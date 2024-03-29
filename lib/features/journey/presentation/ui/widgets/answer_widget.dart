import 'package:flutter/material.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerEntity answer;
  final Function callbackSelectAnswer;

  AnswerWidget({super.key, required this.answer, required this.callbackSelectAnswer});

  final ValueNotifier _isSelectAnswer = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callbackSelectAnswer(answer.correct),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        decoration: BoxDecoration(
          color: AppColor.colorMainWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextWidget(
                text: answer.answer ?? '',
                color: AppColor.colorMainBlack,
                fontSize: AppHelper.setMultiDeviceSize(16.sp, 12.sp),
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(width: 16),
            ValueListenableBuilder(
              valueListenable: _isSelectAnswer,
              builder: (_, value, __) => _isSelectAnswer.value
                  ? Icon(
                      answer.correct == true ? Icons.check : Icons.clear,
                      color: answer.correct == true ? AppColor.colorMainGreen : AppColor.colorMainRed,
                      size: AppHelper.setMultiDeviceSize(32, 32),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
