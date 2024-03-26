import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotub_app/features/authentication/domain/entities/user_authentication_entity.dart';
import 'package:jotub_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:jotub_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:jotub_app/features/home/presentation/ui/widgets/button_select_image_gallery_camera_widget.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/cache_image_widget.dart';
import 'package:jotub_app/utils/global_widgets/custom_flush_bar.dart';
import 'package:jotub_app/utils/global_widgets/popup_dialog_alert.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_form_field_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  final UserInfoEntity? userInfo;

  const ProfileScreen({super.key, required this.userInfo});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _agencyController = TextEditingController();
  final TextEditingController _identityNumberController = TextEditingController();
  final TextEditingController _salesNameController = TextEditingController();
  final TextEditingController _salesPhoneNumberController = TextEditingController();
  final TextEditingController _busNumberController = TextEditingController();
  final TextEditingController _hotelNameController = TextEditingController();

  final ValueNotifier _pathImageSelected = ValueNotifier<String>('');

  @override
  void initState() {
    if (widget.userInfo != null) {
      _agencyController.text = widget.userInfo?.userCompany ?? '';
      _identityNumberController.text = widget.userInfo?.identityCardNumber ?? '';
      _salesNameController.text = widget.userInfo?.salesName ?? '';
      _salesPhoneNumberController.text = widget.userInfo?.salesPhoneNumber ?? '';
      _busNumberController.text = widget.userInfo?.busNo ?? '';
      _hotelNameController.text = widget.userInfo?.hotel ?? '';
      _pathImageSelected.value = widget.userInfo?.avatar ?? '';
    }
    super.initState();
  }

  Future<void> _showModalBottomSheetMenuSelectImage() async {
    await showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          width: 100.w,
          padding: const EdgeInsets.only(top: 20, bottom: 32, left: 32, right: 32),
          decoration: const BoxDecoration(
            color: AppColor.colorMainWhite,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ValueListenableBuilder(
                valueListenable: _pathImageSelected,
                builder: (_, value, __) => GestureDetector(
                  onTap: () async {
                    if (_pathImageSelected.value != '') {
                      Navigator.of(context).pop();
                      await PopupDialogAlert.showPopupWithUIParamFullScreen(
                        context,
                        AvatarFullScreenWidget(imagePath: _pathImageSelected.value),
                      );
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColor.colorSecondaryGray,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(AppAssets.iconAccount, width: 20, height: 20, color: _pathImageSelected.value != '' ? AppColor.colorMainBlack : AppColor.colorMainGray),
                      ),
                      TextWidget(
                        text: S.of(context).showFullAvatar,
                        color: _pathImageSelected.value != '' ? AppColor.colorMainBlack : AppColor.colorMainGray,
                        fontSize: AppHelper.setMultiDeviceSize(18.sp, 14.sp),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async => await PopupDialogAlert.showPopupWithUIParam(
                  context,
                  ButtonSelectImageGalleryCameraWidget(callBackReturnImageSelected: (pathImage) {
                    _pathImageSelected.value = pathImage;
                    context.read<HomeBloc>().add(const FetchUserProfileEvent());
                    Navigator.of(context).pop();
                  }),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColor.colorSecondaryGray,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(AppAssets.iconImage, width: 20, height: 20, color: AppColor.colorMainBlack),
                    ),
                    TextWidget(
                      text: S.of(context).changeAvatar,
                      color: AppColor.colorMainBlack,
                      fontSize: AppHelper.setMultiDeviceSize(18.sp, 14.sp),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      isHasButtonBack: true,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.imgBannerAndLogo,
                    width: 100.w,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: AppHelper.setMultiDeviceSize(120, 120),
                    height: AppHelper.setMultiDeviceSize(120, 120),
                    transform: Matrix4.translationValues(0, -34, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: AppColor.colorMainWhite),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: ValueListenableBuilder(
                            valueListenable: _pathImageSelected,
                            builder: (_, value, __) => _pathImageSelected.value != ''
                                ? _pathImageSelected.value.toString().contains('https://')
                                    ? CacheImageWidget(
                                        imageUrl: widget.userInfo!.avatar,
                                        widthImage: AppHelper.setMultiDeviceSize(120, 120),
                                        heightImage: AppHelper.setMultiDeviceSize(120, 120),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.file(
                                        File(_pathImageSelected.value),
                                        width: AppHelper.setMultiDeviceSize(120, 120),
                                        height: AppHelper.setMultiDeviceSize(120, 120),
                                        fit: BoxFit.cover,
                                      )
                                : Image.asset(
                                    AppAssets.iconAvatar,
                                    width: AppHelper.setMultiDeviceSize(120, 120),
                                    height: AppHelper.setMultiDeviceSize(120, 120),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () async => await _showModalBottomSheetMenuSelectImage(),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColor.colorMainDarkBlue,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 0.4, color: AppColor.colorMainWhite),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: AppHelper.setMultiDeviceSize(18, 18),
                                color: AppColor.colorMainWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    transform: Matrix4.translationValues(0, -30, 0),
                    child: Column(
                      children: [
                        TextWidget(
                          text: widget.userInfo?.name ?? '',
                          color: AppColor.colorMainWhite,
                          fontSize: AppHelper.setMultiDeviceSize(18.sp, 14.sp),
                          fontWeight: FontWeight.w500,
                        ),
                        TextWidget(
                          text: '${S.of(context).group} ${widget.userInfo?.groupId}',
                          color: AppColor.colorMainYellow,
                          fontSize: AppHelper.setMultiDeviceSize(16.sp, 12.sp),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(16, 16)),
                        TextFormFieldWidget(
                          controller: _agencyController,
                          hintText: S.of(context).agency,
                          isReadOnly: true,
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(24, 24)),
                        TextFormFieldWidget(
                          controller: _identityNumberController,
                          hintText: S.of(context).idCardNumber,
                          isReadOnly: true,
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(24, 24)),
                        TextFormFieldWidget(
                          controller: _salesNameController,
                          hintText: S.of(context).salesNameStaffCharge,
                          isReadOnly: true,
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(24, 24)),
                        TextFormFieldWidget(
                          controller: _salesPhoneNumberController,
                          hintText: S.of(context).salesPhoneNumberStaffCharge,
                          isReadOnly: true,
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(24, 24)),
                        TextFormFieldWidget(
                          controller: _busNumberController,
                          hintText: S.of(context).busNo,
                          isReadOnly: true,
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(24, 24)),
                        TextFormFieldWidget(
                          controller: _hotelNameController,
                          hintText: S.of(context).hotel,
                          isReadOnly: true,
                        ),
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                          listenWhen: (previous, current) => current is LogoutSuccessState || current is LogoutFailState,
                          listener: (context, state) {
                            if (state is LogoutSuccessState) {
                              Navigator.of(context).pushNamedAndRemoveUntil(AppPaths.selectObjectUseScreen, (route) => false);
                              CustomFlushBar.showAlertFlushBar(context, state.message, isSuccess: true);
                            }
                            if (state is LogoutFailState) {
                              CustomFlushBar.showAlertFlushBar(context, state.message);
                            }
                          },
                          buildWhen: (previous, current) => current is LogoutSuccessState || current is LogoutFailState || current is LogoutLoadingState,
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () => state is! LogoutLoadingState ? context.read<AuthenticationBloc>().add(LogoutEvent()) : null,
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                margin: EdgeInsets.only(top: AppHelper.setMultiDeviceSize(24, 24)),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: AppColor.colorMainRed,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(width: 1, color: AppColor.colorMainRed),
                                ),
                                child: state is LogoutLoadingState
                                    ? SpinKitLoadingWidget(
                                        size: AppHelper.setMultiDeviceSize(20.sp, 16.sp),
                                        color: AppColor.colorMainWhite,
                                      )
                                    : TextWidget(
                                        text: S.of(context).logout,
                                        color: AppColor.colorMainWhite,
                                        fontSize: AppHelper.setMultiDeviceSize(18.sp, 14.sp),
                                        fontWeight: FontWeight.w500,
                                      ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarFullScreenWidget extends StatelessWidget {
  final String imagePath;

  const AvatarFullScreenWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      color: AppColor.colorMainBlack,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColor.colorMainWhite),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(Icons.clear, size: 18, color: AppColor.colorMainWhite),
            ),
          ),
          Expanded(
              child: imagePath.contains('https://')
                  ? CacheImageWidget(
                      imageUrl: imagePath,
                      widthImage: 100.w,
                      fit: BoxFit.fitWidth,
                    )
                  : Image.file(File(imagePath), width: 100.w, fit: BoxFit.fitWidth)),
        ],
      ),
    );
  }
}
