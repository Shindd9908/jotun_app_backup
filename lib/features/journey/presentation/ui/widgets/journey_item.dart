import 'package:flutter/material.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class JourneyItem extends StatelessWidget {
  const JourneyItem({
    Key? key,
    this.unlock = true,
  }) : super(key: key);

  final bool unlock;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 16,
      ),
      width: 40.w,
      height: 12.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          colors: [
            Colors.transparent,
            AppColor.colorMainWhite,
            Colors.transparent,
          ],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [
                Colors.white24,
                AppColor.colorMainWhite,
                Colors.white24,
              ],
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  AppAssets.imgJourneyItem1,
                  fit: BoxFit.cover,
                  height: 12.h,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black.withOpacity(unlock ? 0.6 : 0.95),
                ),
              ),
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      unlock ? AppAssets.iconMarked : AppAssets.iconLockJourneyItem,
                      width: 9.w,
                      height: 9.w,
                    ),
                    const SizedBox(height: 4),
                    TextWidget(
                      text: unlock ? S.of(context).completed.toUpperCase() : 'QUÉT MÃ MỞ KHÓA\nKHU VỰC CHỤP ẢNH',
                      color: AppColor.colorMainWhite,
                      fontSize: unlock ? 12.sp : 8.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w900,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
