import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class ScreenFrame extends StatelessWidget {
  const ScreenFrame({
    super.key,
    required this.child,
    this.callBackPopScreen,
    this.isHasButtonBack,
    this.isCenter,
    this.imgBackground,
  });

  final Widget child;
  final Function? callBackPopScreen;
  final bool? isHasButtonBack;
  final bool? isCenter;
  final String? imgBackground;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w),
        height: AppHelper.setMultiDeviceSize(context, 1133.h, 852.h),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgBackground ?? AppAssets.imgBackgroundPage),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: isCenter == true ? 0 : MediaQuery.of(context).padding.top + AppHelper.setMultiDeviceSize(context, 16.h, 16.h)),
        child: Column(
          mainAxisAlignment: isCenter == true ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            if (isHasButtonBack == true)
              Padding(
                padding: EdgeInsets.only(
                  left: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
                  bottom: AppHelper.setMultiDeviceSize(context, 8.h, 8.h),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    if (callBackPopScreen != null) {
                      callBackPopScreen!();
                    }
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      AppAssets.iconArrowBack,
                      width: AppHelper.setMultiDeviceSize(context, 36.w, 32.w),
                      height: AppHelper.setMultiDeviceSize(context, 36.w, 32.w),
                    ),
                  ),
                ),
              ),
            child,
          ],
        ),
      ),
    );
  }
}
