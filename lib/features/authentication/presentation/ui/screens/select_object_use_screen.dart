import 'package:flutter/material.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w),
        height: AppHelper.setMultiDeviceSize(context, 1133.h, 852.h),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + AppHelper.setMultiDeviceSize(context, 80.h, 30.h), left: AppHelper.setMultiDeviceSize(context, 80.h, 32.h), right: 32.w),
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
              AppAssets.imgLogoAppBackup,
              width: AppHelper.setMultiDeviceSize(context, 744.w * 35 / 100, 393.w * 40 / 100),
              fit: BoxFit.cover,
            ),
            //SizedBox(height: AppHelper.setMultiDeviceSize(context, 50.h, 40.h)),
            TextWidget(
              text: S.of(context).journeyDiscovery,
              color: AppColor.colorMainWhite,
              fontSize: AppHelper.setMultiDeviceSize(context, 26.sp, 18.sp),
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              text: S.of(context).inclusiveness,
              color: AppColor.colorMainWhite,
              fontSize: AppHelper.setMultiDeviceSize(context, 60.sp, 44.sp),
              fontWeight: FontWeight.w900,
            ),
            SizedBox(height: AppHelper.setMultiDeviceSize(context, 744.w * 12 / 100, 393.w * 16 / 100)),
            TextWidget(
              text: S.of(context).objectUse,
              color: AppColor.colorMainWhite,
              fontSize: AppHelper.setMultiDeviceSize(context, 34.sp, 24.sp),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: AppHelper.setMultiDeviceSize(context, 20.h, 12.h)),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppPaths.loginScreen, arguments: {'userRole': 3}),
              child: ButtonSubmitWidget(
                title: S.of(context).agency,
                widthButton: AppHelper.setMultiDeviceSize(context, 744.w * 52 / 100, 393.w * 76 / 100),
                heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 70.h),
              ),
            ),
            SizedBox(height: AppHelper.setMultiDeviceSize(context, 24.h, 16.h)),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppPaths.loginScreen, arguments: {'userRole': 2}),
              child: ButtonSubmitWidget(
                title: S.of(context).memberOfJotun,
                widthButton: AppHelper.setMultiDeviceSize(context, 744.w * 52 / 100, 393.w * 76 / 100),
                heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 70.h),
              ),
            ),
            SizedBox(height: AppHelper.setMultiDeviceSize(context, 24.h, 16.h)),
            TextWidget(
              text: "Hoặc",
              color: AppColor.colorMainWhite,
              fontSize: AppHelper.setMultiDeviceSize(context, 34.sp, 24.sp),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: AppHelper.setMultiDeviceSize(context, 24.h, 16.h)),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppPaths.registerScreen),
              child: ButtonSubmitWidget(
                title: "Đăng ký tài khoản mới",
                widthButton: AppHelper.setMultiDeviceSize(context, 744.w * 52 / 100, 393.w * 76 / 100),
                heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 70.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
