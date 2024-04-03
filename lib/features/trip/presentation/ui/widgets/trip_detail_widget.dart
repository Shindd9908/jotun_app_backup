import 'package:flutter/material.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class TripDetailWidget extends StatelessWidget {
  final TripEntity trip;
  final bool unlock;
  final int tripIndex;

  const TripDetailWidget({Key? key, required this.unlock, required this.trip, required this.tripIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (100.w - AppHelper.setMultiDeviceSize(64, 64)) * 2 / 3.2,
      width: 100.w - AppHelper.setMultiDeviceSize(64, 64),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: EdgeInsets.only(top: tripIndex == 1 ? 0 : 12),
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
                        fontSize: AppHelper.setMultiDeviceSize(22.sp, 20.sp),
                        fontWeight: FontWeight.w900,
                        textAlign: TextAlign.center,
                      ),
                      TextWidget(
                        text: trip.title ?? '',
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(18.sp, 14.sp),
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        width: AppHelper.setMultiDeviceSize(28.w, 28.w),
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
                        fontSize: AppHelper.setMultiDeviceSize(12.sp, 8.sp),
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: AppHelper.setMultiDeviceSize(8, 8),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Image.asset(
                AppAssets.iconLock,
                width: AppHelper.setMultiDeviceSize(48, 48),
                height: AppHelper.setMultiDeviceSize(48, 48),
              ),
            ),
    );
  }
}
