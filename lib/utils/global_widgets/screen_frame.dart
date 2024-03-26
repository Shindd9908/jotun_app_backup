import 'package:flutter/material.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class ScreenFrame extends StatelessWidget {
  const ScreenFrame({super.key, required this.child, this.callBackPopScreen, this.isHasButtonBack});

  final Widget child;
  final Function? callBackPopScreen;
  final bool? isHasButtonBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgBackgroundPage),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + AppHelper.setMultiDeviceSize(8, 8)),
        child: Column(
          children: [
            if (isHasButtonBack == true)
              Padding(
                padding: EdgeInsets.only(left: AppHelper.setMultiDeviceSize(32, 32), bottom: AppHelper.setMultiDeviceSize(8, 8)),
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
                      width: AppHelper.setMultiDeviceSize(32, 32),
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
