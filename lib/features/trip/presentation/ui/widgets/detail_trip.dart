import 'package:flutter/material.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class DetailTrip extends StatelessWidget {
  const DetailTrip({
    Key? key,
    this.textDay,
    this.content,
    this.backgroundImage,
    this.unlock = true,
  }) : super(key: key);

  final String? textDay;
  final String? content;
  final String? backgroundImage;
  final bool unlock;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: unlock
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage ?? ''),
                fit: BoxFit.fill,
                opacity: 0.3,
              ),
              borderRadius: BorderRadius.circular(16),
            )
          : BoxDecoration(
              color: AppColor.colorMainDarkBlue,
              borderRadius: BorderRadius.circular(16),
            ),
      child: unlock
          ? Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: textDay,
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(19.sp, 20.sp),
                        fontWeight: FontWeight.w900,
                        textAlign: TextAlign.center,
                      ),
                      TextWidget(
                        text: content,
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(19.sp, 14.sp),
                        fontWeight: FontWeight.w900,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 28.w,
                        child: const Divider(
                          color: Colors.white,
                          height: 4,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(AppPaths.scheduleScreen),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget(
                        text: S.of(context).goToDetailTrip,
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(19.sp, 8.sp),
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 8.sp,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Image.asset(
                AppAssets.iconLock,
                width: 12.w,
                height: 12.w,
              ),
            ),
    );
  }
}
