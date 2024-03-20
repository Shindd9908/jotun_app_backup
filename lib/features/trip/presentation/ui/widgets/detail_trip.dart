import 'package:flutter/material.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class DetailTrip extends StatelessWidget {
  const DetailTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      margin: EdgeInsets.only(
        bottom: 12.h,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/image_schedule_2.jpg'),
          fit: BoxFit.fill,
          opacity: 0.3,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'NGÀY 1:',
                  color: AppColor.colorMainWhite,
                  fontSize: AppHelper.setWithHeightFontSizeDevicesTabletMobile(19.sp, 20.sp),
                  fontWeight: FontWeight.w900,
                  textAlign: TextAlign.center,
                ),
                TextWidget(
                  text: 'Trải nghiệm show diễn thực cảnh\nKý ức Hội An',
                  color: AppColor.colorMainWhite,
                  fontSize: AppHelper.setWithHeightFontSizeDevicesTabletMobile(19.sp, 14.sp),
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
                  fontSize: AppHelper.setWithHeightFontSizeDevicesTabletMobile(19.sp, 8.sp),
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
      ),
    );
  }
}
