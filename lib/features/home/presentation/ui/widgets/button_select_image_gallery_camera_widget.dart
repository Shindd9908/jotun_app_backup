import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jotub_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/utils/global_widgets/custom_flush_bar.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';

//ignore: must_be_immutable
class ButtonSelectImageGalleryCameraWidget extends StatelessWidget {
  final Function? callBackReturnImageSelected;

  ButtonSelectImageGalleryCameraWidget({super.key, this.callBackReturnImageSelected});

  String imagePathSelected = '';

  Future<void> _selectImage(BuildContext context, bool isCamera) async {
    XFile? result = await ImagePicker().pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (result != null) {
      if (context.mounted) {
        imagePathSelected = result.path;
        context.read<HomeBloc>().add(UpdateUserAvatarEvent(fileImageAvatar: File(result.path)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is UpdateUserAvatarSuccessState || current is UpdateUserAvatarFailState,
      listener: (context, state) {
        if (state is UpdateUserAvatarSuccessState) {
          callBackReturnImageSelected!(imagePathSelected);
          CustomFlushBar.showAlertFlushBar(context, state.message, isSuccess: true);
        }
        if (state is UpdateUserAvatarFailState) {
          CustomFlushBar.showAlertFlushBar(context, state.message);
        }
        Navigator.of(context).pop();
      },
      buildWhen: (previous, current) => current is UpdateUserAvatarSuccessState || current is UpdateUserAvatarFailState || current is UpdateUserAvatarLoadingState,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () async => state is! UpdateUserAvatarLoadingState ? await _selectImage(context, false) : null,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: EdgeInsets.only(top: 12.h, bottom: 6.h),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: state is UpdateUserAvatarLoadingState
                    ? SpinKitLoadingWidget(
                        size: AppHelper.setMultiDeviceSize(context, 26.sp, 16.sp),
                        color: Colors.black,
                      )
                    : TextWidget(
                        text: S.of(context).selectAvatarFromGallery,
                        fontSize: AppHelper.setMultiDeviceSize(context, 24.sp, 14.sp),
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
              ),
            ),
            GestureDetector(
              onTap: () async => state is! UpdateUserAvatarLoadingState ? await _selectImage(context, true) : null,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: EdgeInsets.only(top: 6.h, bottom: 12.h),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: state is UpdateUserAvatarLoadingState
                    ? SpinKitLoadingWidget(
                        size: AppHelper.setMultiDeviceSize(context, 26.sp, 16.sp),
                        color: Colors.black,
                      )
                    : TextWidget(
                        text: S.of(context).selectAvatarFromCamera,
                        fontSize: AppHelper.setMultiDeviceSize(context, 24.sp, 14.sp),
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
