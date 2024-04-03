import 'package:flutter/material.dart';
import 'package:jotub_app/features/order/presentation/ui/widgets/order_item.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: Image.asset(
              AppAssets.imgLogoApp,
              width: 40.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 16),
            child: TextWidget(
              text: S.of(context).preOrderProduct,
              color: AppColor.colorMainWhite,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w900,
              fontSize: 22.sp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                OrderItem(image: AppAssets.itemPack1, amount: _amount),
                OrderItem(image: AppAssets.itemPack2, amount: _amount),
                OrderItem(image: AppAssets.itemPack3, amount: _amount),
                OrderItem(image: AppAssets.itemPack4, amount: _amount),
                Container(
                  color: AppColor.colorMainYellow,
                  height: 1.5,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: S.of(context).totalAmount,
                      color: AppColor.colorMainWhite,
                      fontWeight: FontWeight.normal,
                      fontSize: 11.sp,
                    ),
                    TextWidget(
                      text: '${_amount * 4} ${S.of(context).litre}',
                      color: AppColor.colorMainYellow,
                      fontWeight: FontWeight.w900,
                      fontSize: 11.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ButtonSubmitWidget(
              widthButton: 60.w,
              title: S.of(context).order,
            ),
          ),
        ],
      ),
    );
  }
}
