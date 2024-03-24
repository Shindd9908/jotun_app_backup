import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class ButtonSelectImageGalleryCameraWidget extends StatelessWidget {
  final Function? callBackReturnImageSelected;

  ButtonSelectImageGalleryCameraWidget({super.key, this.callBackReturnImageSelected});

  final ValueNotifier _isShowLoadingWaitLoadImageGallery = ValueNotifier(false);
  final ValueNotifier _isShowLoadingWaitLoadImageCamera = ValueNotifier(false);

  Future<void> _selectImage(BuildContext context, bool isCamera) async {
    if (isCamera) {
      _isShowLoadingWaitLoadImageCamera.value = true;
    } else {
      _isShowLoadingWaitLoadImageGallery.value = true;
    }
    XFile? result = await ImagePicker().pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (result != null) {
      if (isCamera) {
        _isShowLoadingWaitLoadImageCamera.value = false;
      } else {
        _isShowLoadingWaitLoadImageGallery.value = false;
      }
      callBackReturnImageSelected!(result.path);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder(
          valueListenable: _isShowLoadingWaitLoadImageGallery,
          builder: (_, value, __) => GestureDetector(
            onTap: () async => !_isShowLoadingWaitLoadImageGallery.value ? await _selectImage(context, false) : null,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 12, bottom: 6),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(60),
              ),
              child: _isShowLoadingWaitLoadImageGallery.value
                  ? SpinKitLoadingWidget(
                      size: AppHelper.setMultiDeviceSize(16.sp, 16.sp),
                      color: Colors.black,
                    )
                  : TextWidget(
                      text: S.of(context).selectAvatarFromGallery,
                      fontSize: AppHelper.setMultiDeviceSize(14.sp, 14.sp),
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _isShowLoadingWaitLoadImageCamera,
          builder: (_, value, __) => GestureDetector(
            onTap: () async => !_isShowLoadingWaitLoadImageCamera.value ? await _selectImage(context, true) : null,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 6, bottom: 12),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(60),
              ),
              child: _isShowLoadingWaitLoadImageCamera.value
                  ? SpinKitLoadingWidget(
                      size: AppHelper.setMultiDeviceSize(16.sp, 16.sp),
                      color: Colors.black,
                    )
                  : TextWidget(
                      text: S.of(context).selectAvatarFromCamera,
                      fontSize: AppHelper.setMultiDeviceSize(14.sp, 14.sp),
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
