import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class BackgroundScreenFormFieldWidget extends StatelessWidget {
  final Widget mainUIContent;

  const BackgroundScreenFormFieldWidget({super.key, required this.mainUIContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w),
          height: AppHelper.setMultiDeviceSize(context, 1133.h, 852.h),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgBackgroundPage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(child: mainUIContent)
      ],
    );
  }
}
