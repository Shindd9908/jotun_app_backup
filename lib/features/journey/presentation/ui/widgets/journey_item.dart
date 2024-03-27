import 'package:flutter/material.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/cache_image_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class JourneyItem extends StatelessWidget {
  final AreaEntity? area;

  const JourneyItem({Key? key, this.area}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          colors: [Colors.transparent, AppColor.colorMainWhite, Colors.transparent],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [Colors.white24, AppColor.colorMainWhite, Colors.white24],
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight,
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CacheImageWidget(
                imageUrl: area?.areaImage ?? '',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black.withOpacity(area?.unlock == true ? 0.6 : 0.95),
              ),
            ),
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    area?.unlock == true ? AppAssets.iconMarked : AppAssets.iconLockJourneyItem,
                    width: 9.w,
                    height: 9.w,
                  ),
                  const SizedBox(height: 4),
                  TextWidget(
                    text: area?.unlock == true
                        ? S.of(context).completed.toUpperCase()
                        : '${S.of(context).alert_block_item_area}\n${area?.areaName ?? ''}',
                    color: AppColor.colorMainWhite,
                    fontSize: area?.unlock == true ? 12.sp : 8.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w900,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
