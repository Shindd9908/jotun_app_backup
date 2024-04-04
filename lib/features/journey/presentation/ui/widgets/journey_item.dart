import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/cache_image_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/routers/paths.dart';

class JourneyItem extends StatelessWidget {
  final AreaEntity area;
  final bool isUnlock;

  const JourneyItem({Key? key, required this.area, required this.isUnlock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => !isUnlock ? Navigator.of(context).pushNamed(AppPaths.scanQRCodeScreen, arguments: {'area': area}) : null,
      child: Container(
        height: 50,
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
          padding: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
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
                  imageUrl: area.areaImage ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.black.withOpacity(isUnlock == true ? 0.6 : 0.95),
                ),
              ),
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(isUnlock == true ? AppAssets.iconMarked : AppAssets.iconLockJourneyItem,),
                    SizedBox(height: 4.h),
                    TextWidget(
                      text: isUnlock == true
                          ? S.of(context).completed.toUpperCase()
                          : '${S.of(context).alertBlockItemArea}\n${area.areaName != null ? area.areaName!.toUpperCase() : ''}',
                      color: AppColor.colorMainWhite,
                      fontSize: isUnlock == true ? 14.sp : 12.sp,
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
