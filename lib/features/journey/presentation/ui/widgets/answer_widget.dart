import 'package:flutter/material.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class AnswerWidget extends StatelessWidget {
  final List<AnswerEntity> listAnswer;
  final Function callbackSelectAnswer;

  AnswerWidget({super.key, required this.listAnswer, required this.callbackSelectAnswer});

  final ValueNotifier _isAllowSelectAnswer = ValueNotifier<bool>(true);
  final ValueNotifier _indexAnswerSelected = ValueNotifier<int>(-1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        listAnswer.length,
        (index) => GestureDetector(
          onTap: () {
            if (_isAllowSelectAnswer.value) {
              _isAllowSelectAnswer.value = false;
              _indexAnswerSelected.value = index;
              callbackSelectAnswer(listAnswer[index].correct);
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColor.colorMainWhite,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: TextWidget(
                      text: listAnswer[index].answer ?? '',
                      color: AppColor.colorMainBlack,
                      fontSize: AppHelper.setMultiDeviceSize(16.sp, 12.sp),
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ValueListenableBuilder(
                  valueListenable: _indexAnswerSelected,
                  builder: (_, value, __) => _indexAnswerSelected.value != -1 && _indexAnswerSelected.value == index
                      ? Icon(
                          listAnswer[index].correct == true ? Icons.check : Icons.clear,
                          color: listAnswer[index].correct == true ? AppColor.colorMainGreen : AppColor.colorMainRed,
                          size: AppHelper.setMultiDeviceSize(32, 32),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
