import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/order/presentation/ui/widgets/confirm_order_item.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28),
              child: Image.asset(
                AppAssets.imgLogoApp,
                width: AppHelper.setMultiDeviceSize(context, 744.w * 35 / 100, 393.w * 40 / 100),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
              child: TextWidget(
                text: S.of(context).orderInformation,
                color: AppColor.colorMainWhite,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w900,
                fontSize: 28.sp,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: AppColor.colorBackgroundOrderScreen,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColor.colorMainWhite,
                  width: 3,
                ),
              ),
              padding: EdgeInsets.only(
                left: 24.w,
                right: 12.w,
                top: 8.h,
                bottom: 24.h,
              ),
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: const Column(
                children: [
                  ConfirmOrderItem(
                    titleProduct: AppAssets.itemPack1Title,
                    image: AppAssets.itemPack1,
                    amount: 100,
                  ),
                  ConfirmOrderItem(
                    titleProduct: AppAssets.itemPack2Title,
                    image: AppAssets.itemPack2,
                    amount: 10,
                  ),
                  ConfirmOrderItem(
                    titleProduct: AppAssets.itemPack3Title,
                    image: AppAssets.itemPack3,
                    amount: 90,
                  ),
                  ConfirmOrderItem(
                    titleProduct: AppAssets.itemPack4Title,
                    image: AppAssets.itemPack4,
                    amount: 90,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            TextWidget(
              text: S.of(context).timeToOrderProduct1,
              color: AppColor.colorMainWhite,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontSize: 14.sp,
            ),
            TextWidget(
              text: S.of(context).timeToOrderProduct2,
              color: AppColor.colorMainYellow,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontSize: 14.sp,
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                ButtonSubmitWidget(
                  title: S.of(context).saveButton,
                  widthButton: AppHelper.setMultiDeviceSize(context, 210.w, 92.w),
                  heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 52.h),
                  isSmallButton: true,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: ButtonSubmitWidget(
                      title: S.of(context).changeInformationButton,
                      heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 52.h),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
