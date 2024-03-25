import 'package:flutter/material.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({Key? key, required this.iconAsset, required this.title}) : super(key: key);

  final String iconAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          margin: const EdgeInsets.only(bottom: 4),
          decoration: const BoxDecoration(
            color: Color(0xff848689),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Image.asset(iconAsset, width: AppHelper.setMultiDeviceSize(40, 40), height: AppHelper.setMultiDeviceSize(40, 40)),
        ),
        TextWidget(
          text: title,
          color: AppColor.colorMainWhite,
          fontSize: AppHelper.setMultiDeviceSize(12.sp, 8.sp),
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          height: 1.2,
        ),
      ],
    );
  }
}
