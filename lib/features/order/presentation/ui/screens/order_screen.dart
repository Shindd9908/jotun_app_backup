import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/order/presentation/ui/widgets/order_item.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final int _amount = 100;

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 28.h),
              child: Image.asset(
                AppAssets.imgLogoAppBackup,
                width: AppHelper.setMultiDeviceSize(context, 744.w * 35 / 100, 393.w * 40 / 100),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
              child: TextWidget(
                text: S.of(context).preOrderProduct,
                color: AppColor.colorMainWhite,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w900,
                fontSize: 28.sp,
              ),
            ),
            Column(
              children: [
                OrderItem(titleProduct: AppAssets.itemPack1Title, image: AppAssets.itemPack1, amount: _amount),
                SizedBox(height: 20.h),
                OrderItem(titleProduct: AppAssets.itemPack2Title, image: AppAssets.itemPack2, amount: _amount),
                SizedBox(height: 20.h),
                OrderItem(titleProduct: AppAssets.itemPack3Title, image: AppAssets.itemPack3, amount: _amount),
                SizedBox(height: 20.h),
                OrderItem(titleProduct: AppAssets.itemPack4Title, image: AppAssets.itemPack4, amount: _amount),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                  child: Divider(
                    color: AppColor.colorMainYellow,
                    thickness: 1.5.h,
                    height: 1.5.h,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: S.of(context).totalAmount,
                      color: AppColor.colorMainWhite,
                      fontWeight: FontWeight.normal,
                      fontSize: 13.sp,
                    ),
                    TextWidget(
                      text: '${_amount * 4} ${S.of(context).litre}',
                      color: AppColor.colorMainYellow,
                      fontWeight: FontWeight.w900,
                      fontSize: 13.sp,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed(AppPaths.confirmOrderScreen),
                child: ButtonSubmitWidget(
                  widthButton: AppHelper.setMultiDeviceSize(context, 210.w, 210.w),
                  heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 62.h),
                  title: S.of(context).order,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
