import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/authentication/domain/entities/user_authentication_entity.dart';
import 'package:jotub_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/background_screen_form_field_widget.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/custom_flush_bar.dart';
import 'package:jotub_app/utils/global_widgets/text_form_field_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';

class ConfirmAccountInformationScreen extends StatefulWidget {
  final UserInfoEntity? userInfo;

  const ConfirmAccountInformationScreen({super.key, this.userInfo});

  @override
  State<ConfirmAccountInformationScreen> createState() => _ConfirmAccountInformationScreenState();
}

class _ConfirmAccountInformationScreenState extends State<ConfirmAccountInformationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _storeController = TextEditingController();
  final TextEditingController _identityCardNumberController = TextEditingController();
  final TextEditingController _salesStaffChargeController = TextEditingController();
  final TextEditingController _groupController = TextEditingController();

  final ValueNotifier _errorValidateFieldIdCardNumber = ValueNotifier<String>('');

  @override
  void initState() {
    if (widget.userInfo != null) {
      _nameController.text = widget.userInfo?.name ?? '';
      _storeController.text = widget.userInfo?.userCompany ?? '';
      _identityCardNumberController.text = widget.userInfo?.identityCardNumber ?? '';
      _salesStaffChargeController.text = widget.userInfo?.salesName ?? '';
      _groupController.text = widget.userInfo?.groupId != null ? widget.userInfo!.groupId!.toString() : '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundScreenFormFieldWidget(
        mainUIContent: Container(
          width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w),
          height: AppHelper.setMultiDeviceSize(context, 1133.h, 852.h) - MediaQuery.of(context).viewInsets.bottom - MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(
            //top: AppHelper.setMultiDeviceSize(context, 70.h, 48.h),
            left: AppHelper.setMultiDeviceSize(context, 744.w / 12 + 48.w, 32.w),
            right: AppHelper.setMultiDeviceSize(context, 744.w / 12 + 48.w, 32.w),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.imgLogoAppBackup,
                  width: AppHelper.setMultiDeviceSize(context, 744.w * 35 / 100, 393.w * 40 / 100),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(context, 60.h, 30.h)),
                TextWidget(
                  text: S.of(context).accountInformation,
                  color: AppColor.colorMainWhite,
                  fontSize: AppHelper.setMultiDeviceSize(context, 34.sp, 24.sp),
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                TextFormFieldWidget(
                  controller: _nameController,
                  hintText: S.of(context).fullName,
                  isReadOnly: true,
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                TextFormFieldWidget(
                  controller: _storeController,
                  hintText: S.of(context).store,
                  isReadOnly: true,
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                ValueListenableBuilder(
                  valueListenable: _errorValidateFieldIdCardNumber,
                  builder: (_, value, __) => TextFormFieldWidget(
                    controller: _identityCardNumberController,
                    hintText: S.of(context).idCardNumber,
                    isNumberNoOption: true,
                    errorMessageValidate: _errorValidateFieldIdCardNumber.value,
                    callBackOnChange: (value) => _errorValidateFieldIdCardNumber.value = AppHelper.validateFieldIdCardNumber(context, value),
                  ),
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                TextFormFieldWidget(
                  controller: _salesStaffChargeController,
                  hintText: S.of(context).salesNameStaffCharge,
                  isReadOnly: true,
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                TextFormFieldWidget(
                  controller: _groupController,
                  hintText: S.of(context).group,
                  isReadOnly: true,
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listenWhen: (previous, current) => current is ConfirmAccountSuccessState || current is ConfirmAccountFailState,
                  listener: (context, state) {
                    if (state is ConfirmAccountSuccessState) {
                      Navigator.of(context).pushNamedAndRemoveUntil(AppPaths.homeScreen, (route) => false);
                      CustomFlushBar.showAlertFlushBar(context, state.message, isSuccess: true);
                    }
                    if (state is ConfirmAccountFailState) {
                      CustomFlushBar.showAlertFlushBar(context, state.message);
                    }
                  },
                  buildWhen: (previous, current) => current is ConfirmAccountSuccessState || current is ConfirmAccountFailState || current is ConfirmAccountLoadingState,
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        _errorValidateFieldIdCardNumber.value = AppHelper.validateFieldIdCardNumber(context, _identityCardNumberController.text.trim());
                        if (_errorValidateFieldIdCardNumber.value == '' && state is! ConfirmAccountLoadingState) {
                          context.read<AuthenticationBloc>().add(ConfirmAccountEvent(identityCardNumber: _identityCardNumberController.text.trim()));
                        }
                      },
                      child: ButtonSubmitWidget(
                        title: S.of(context).confirmInformation,
                        widthButton: AppHelper.setMultiDeviceSize(context, 744.w * 52 / 100, 393.w * 76 / 100),
                        heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 70.h),
                        isShowLoading: state is ConfirmAccountLoadingState,
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
