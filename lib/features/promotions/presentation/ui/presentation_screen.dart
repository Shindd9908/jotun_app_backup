import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      imgBackground: AppAssets.imgBackgroundNew,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Image.asset(
              AppAssets.imgLogoAppBackup,
              fit: BoxFit.contain,
              height: 30.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: TextWidget(
              text: S.of(context).promotionProgramTitle.toUpperCase(),
              fontSize: 20.sp,
              color: AppColor.colorMainWhite,
              fontWeight: FontWeight.w900,
            ),
          ),
          TextWidget(
            text: S.of(context).promotionTitle.toUpperCase(),
            fontSize: 36.sp,
            color: AppColor.colorMainWhite,
            fontWeight: FontWeight.w900,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: S.of(context).promotionDiscount.toUpperCase(),
                        fontSize: 16.sp,
                        color: AppColor.colorMainWhite,
                        fontWeight: FontWeight.w600,
                      ),
                      TextWidget(
                        text: "15%".toUpperCase(),
                        fontSize: 36.sp,
                        color: AppColor.colorMainYellow,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppColor.colorMainWhite,
                  width: 3.w,
                  height: AppHelper.setMultiDeviceSize(context, 65.w, 65.w),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    gradient: AppColor.colorBackgroundPromotions,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                      bottomRight: Radius.circular(8.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: S.of(context).timePeriod.toUpperCase(),
                        fontSize: 14.sp,
                        color: AppColor.colorMainWhite,
                        fontWeight: FontWeight.w600,
                      ),
                      TextWidget(
                        text: "Từ ngày 08.05.2024 đến 31.07.2024".toUpperCase(),
                        fontSize: 14.sp,
                        color: AppColor.colorMainWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  AppAssets.imgSonPng,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0.0,
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: S.of(context).promotionDiscount.toUpperCase(),
                            style: TextStyle(
                              color: AppColor.colorMainBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: ' Thêm 2%'.toUpperCase(),
                            style: GoogleFonts.outfit(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColor.colorMainRed,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextWidget(
                      text: "Từ 08.05 - 10.05.2024".toUpperCase(),
                      fontSize: 15.sp,
                      color: AppColor.colorMainBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
