import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';

class TripDetailWidget extends StatelessWidget {
  final TripEntity trip;
  final bool unlock;
  final int tripIndex;

  const TripDetailWidget({Key? key, required this.unlock, required this.trip, required this.tripIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (AppHelper.setMultiDeviceSize(context, 744.w, 393.w) - 64.w) * 2 / AppHelper.setMultiDeviceSize(context, 5, 3.5),
      width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w) - 64.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
      margin: EdgeInsets.only(top: tripIndex == 1 ? 0 : AppHelper.setMultiDeviceSize(context, 24.h, 12.h)),
      decoration: unlock
          ? BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(trip.image ?? ''),
                fit: BoxFit.cover,
                opacity: 0.3,
              ),
              borderRadius: BorderRadius.circular(16),
            )
          : BoxDecoration(
              color: AppColor.colorMainBlack,
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
                        text: '${S.of(context).daySchedule} $tripIndex:',
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(context, 32.sp, 20.sp),
                        fontWeight: FontWeight.w900,
                        textAlign: TextAlign.center,
                      ),
                      TextWidget(
                        text: trip.title ?? '',
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(context, 22.sp, 14.sp),
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        width: AppHelper.setMultiDeviceSize(context, 744.w * 28 / 100, 393.w * 28 / 100),
                        child: const Divider(color: Colors.white, height: 4, thickness: 2),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(AppPaths.scheduleScreen, arguments: {'trip': trip, 'tripIndex': tripIndex}),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget(
                        text: S.of(context).goToDetailTrip,
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(context, 18.sp, 12.sp),
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: AppHelper.setMultiDeviceSize(context, 16.w, 10.w),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Image.asset(
                AppAssets.iconLock,
                width: AppHelper.setMultiDeviceSize(context, 82.w, 48.w),
                height: AppHelper.setMultiDeviceSize(context, 82.w, 48.w),
              ),
            ),
    );
  }
}
