import 'package:flutter/material.dart';
import 'package:jotub_app/features/home/presentation/ui/widgets/feature_item.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 8.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.iconAvatar,
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'HOÀNG VĂN A',
                              color: AppColor.colorMainWhite,
                              fontSize: AppHelper
                                  .setWithHeightFontSizeDevicesTabletMobile(
                                      19.sp, 14.sp),
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                            TextWidget(
                              text: 'Nhóm 10',
                              color: AppColor.colorMainYellow,
                              fontSize: AppHelper
                                  .setWithHeightFontSizeDevicesTabletMobile(
                                      19.sp, 11.sp),
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/icon_notification.png',
                      width: 10.w,
                    )
                  ],
                ),
              ),
              Image.asset('assets/images/image_banner.png'),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 12,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            text: S.of(context).incomingEvent,
                            color: AppColor.colorMainWhite,
                            fontSize: AppHelper
                                .setWithHeightFontSizeDevicesTabletMobile(
                                    19.sp, 11.sp),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          top: 18,
                          left: 4,
                          right: 4,
                          bottom: 4,
                        ),
                        child: Column(
                          children: [
                            TextWidget(
                              text:
                                  'LỄ KỶ NIỆM 20 NĂM\nNGÀNH SƠN TRANG TRÍ JOTUN VIỆT NAM',
                              color: AppColor.colorMainYellow,
                              fontSize: AppHelper
                                  .setWithHeightFontSizeDevicesTabletMobile(
                                      19.sp, 12.sp),
                              fontWeight: FontWeight.w900,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 18,
                                bottom: 18,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        AppAssets.iconCalendar,
                                        width: 24,
                                      ),
                                      TextWidget(
                                        text: '20:00',
                                        color: AppColor.colorMainWhite,
                                        fontSize: AppHelper
                                            .setWithHeightFontSizeDevicesTabletMobile(
                                                19.sp, 14.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        AppAssets.iconGlobal,
                                        width: 24,
                                      ),
                                      TextWidget(
                                        text: 'Hội trường Ariyana',
                                        color: AppColor.colorMainWhite,
                                        fontSize: AppHelper
                                            .setWithHeightFontSizeDevicesTabletMobile(
                                                19.sp, 14.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            TextWidget(
                              text:
                                  'Yêu cầu sự kiện: Lễ phục, trang phục dự tiệc',
                              color: AppColor.colorMainWhite,
                              fontSize: AppHelper
                                  .setWithHeightFontSizeDevicesTabletMobile(
                                      19.sp, 10.sp),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 28),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextWidget(
                                    text: S.of(context).goToDetailTrip,
                                    color: AppColor.colorMainYellow,
                                    fontSize: AppHelper
                                        .setWithHeightFontSizeDevicesTabletMobile(
                                            19.sp, 10.sp),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: const Color(0xffF19F3B),
                                    size: 10.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 16,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            text: S.of(context).feature,
                            color: AppColor.colorMainWhite,
                            fontSize: AppHelper
                                .setWithHeightFontSizeDevicesTabletMobile(
                                    19.sp, 11.sp),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(AppPaths.tripScreen),
                                  child: FeatureItem(
                                    iconAsset: AppAssets.iconMap,
                                    title: S.of(context).exploreSchedule,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(AppPaths.tripScreen),
                                  child: FeatureItem(
                                    iconAsset: AppAssets.iconProduct,
                                    title: S.of(context).newProductInformation,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(AppPaths.tripScreen),
                                  child: FeatureItem(
                                    iconAsset: AppAssets.iconGift,
                                    title:
                                        S.of(context).experienceAndReceiveGift,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(AppPaths.tripScreen),
                                  child: FeatureItem(
                                    iconAsset: AppAssets.iconMiniGame,
                                    title: S.of(context).miniGame,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(AppPaths.tripScreen),
                                  child: FeatureItem(
                                    iconAsset: AppAssets.iconOrder,
                                    title: S.of(context).preorder,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(AppPaths.tripScreen),
                                  child: FeatureItem(
                                    iconAsset: AppAssets.iconCoupon,
                                    title: S.of(context).promotions,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
