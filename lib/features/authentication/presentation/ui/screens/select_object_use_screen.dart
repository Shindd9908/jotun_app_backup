import 'package:flutter/material.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class SelectObjectUseScreen extends StatefulWidget {
  const SelectObjectUseScreen({super.key});

  @override
  State<SelectObjectUseScreen> createState() => _SelectObjectUseScreenState();
}

class _SelectObjectUseScreenState extends State<SelectObjectUseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + AppHelper.setMultiDeviceSize(6.h, 10.h), left: 32, right: 32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgBackgroundPage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AppAssets.imgLogoApp,
              width: AppHelper.setMultiDeviceSize(40.w, 40.w),
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: AppHelper.setMultiDeviceSize(8.h, 4.h)),
            TextWidget(
              text: S.of(context).journeyDiscovery,
              color: AppColor.colorMainWhite,
              fontSize: AppHelper.setMultiDeviceSize(19.sp, 16.sp),
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              text: S.of(context).inclusiveness,
              color: AppColor.colorMainWhite,
              fontSize: AppHelper.setMultiDeviceSize(22.sp, 30.sp),
              fontWeight: FontWeight.w900,
            ),
            SizedBox(height: AppHelper.setMultiDeviceSize(12.h, 10.h)),
            TextWidget(
              text: S.of(context).objectUse,
              color: AppColor.colorMainWhite,
              fontSize: AppHelper.setMultiDeviceSize(20.sp, 18.sp),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: AppHelper.setMultiDeviceSize(16, 16)),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppPaths.loginScreen, arguments: {'userRole': 3}),
              child: ButtonSubmitWidget(
                title: S.of(context).agency,
                widthButton: AppHelper.setMultiDeviceSize(40.w, 70.w),
              ),
            ),
            SizedBox(height: AppHelper.setMultiDeviceSize(16, 16)),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppPaths.loginScreen, arguments: {'userRole': 2}),
              child: ButtonSubmitWidget(
                title: S.of(context).memberOfJotun,
                widthButton: AppHelper.setMultiDeviceSize(40.w, 70.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
