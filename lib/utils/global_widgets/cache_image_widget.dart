import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart";
import "package:jotub_app/utils/helpers/helpers.dart";

class CacheImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? widthDiskCache;
  final double? heightDiskCache;
  final double? widthImage;
  final double? heightImage;
  final double? radius;
  final BoxFit? fit;
  final String? typeFile;

  const CacheImageWidget({
    super.key,
    this.imageUrl,
    this.widthDiskCache,
    this.widthImage,
    this.heightImage,
    this.radius,
    this.fit,
    this.typeFile,
    this.heightDiskCache,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl != ""
        ? ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0.0),
            child: CachedNetworkImage(
              width: widthImage,
              height: heightImage,
              imageUrl: imageUrl!,
              fit: fit ?? BoxFit.fill,
              placeholder: (context, url) => SpinKitLoadingWidget(color: Colors.grey, size: AppHelper.setMultiDeviceSize(context, 30.w, 18.w)),
              errorWidget: (context, url, error) => Icon(
                Icons.image_outlined,
                size: AppHelper.setMultiDeviceSize(context, 34.w, 24.w),
              ),
            ),
          )
        : Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.image_outlined,
              size: AppHelper.setMultiDeviceSize(context, 34.w, 24.w),
            ),
          );
  }
}
