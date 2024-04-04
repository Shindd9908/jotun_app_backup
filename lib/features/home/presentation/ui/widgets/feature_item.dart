import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

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
          padding: EdgeInsets.all(AppHelper.setMultiDeviceSize(context, 8.w, 4.w)),
          margin: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            color: AppColor.colorBackgroundIconGray,
            borderRadius: BorderRadius.circular(AppHelper.setMultiDeviceSize(context, 16, 8)),
          ),
          child: Image.asset(
            iconAsset,
            width: AppHelper.setMultiDeviceSize(context, 60.w, 34.w),
            height: AppHelper.setMultiDeviceSize(context, 60.w, 34.w),
          ),
        ),
        TextWidget(
          text: title,
          color: AppColor.colorMainWhite,
          fontSize: AppHelper.setMultiDeviceSize(context, 18.sp, 14.sp),
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          height: 1.2,
        ),
      ],
    );
  }
}
