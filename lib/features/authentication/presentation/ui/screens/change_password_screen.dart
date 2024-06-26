import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class ChangePasswordScreen extends StatefulWidget {
  final int? userRole;

  const ChangePasswordScreen({super.key, this.userRole});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  final ValueNotifier _errorValidateFieldPhoneNumber = ValueNotifier<String>('');
  final ValueNotifier _errorValidateFieldCurrentPassword = ValueNotifier<String>('');
  final ValueNotifier _errorValidateFieldNewPassword = ValueNotifier<String>('');
  final ValueNotifier _errorValidateFieldConfirmNewPassword = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundScreenFormFieldWidget(
        mainUIContent: Container(
          width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w),
          height: AppHelper.setMultiDeviceSize(context, 1133.h, 852.h) - MediaQuery.of(context).viewInsets.bottom - MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(
            top: AppHelper.setMultiDeviceSize(context, 32.h, 16.h),
            left: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
            right: AppHelper.setMultiDeviceSize(context, 48.w, 32.w),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    AppAssets.iconArrowBack,
                    width: AppHelper.setMultiDeviceSize(context, 36.w, 32.w),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    //top: AppHelper.setMultiDeviceSize(context, 70.h, 48.h),
                    left: AppHelper.setMultiDeviceSize(context, 744.w / 12, 0),
                    right: AppHelper.setMultiDeviceSize(context, 744.w / 12, 0),
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
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 100.h, 60.h)),
                        TextWidget(
                          text: S.of(context).changePassword,
                          color: AppColor.colorMainWhite,
                          fontSize: AppHelper.setMultiDeviceSize(context, 34.sp, 24.sp),
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 16.h)),
                        ValueListenableBuilder(
                          valueListenable: _errorValidateFieldPhoneNumber,
                          builder: (_, value, __) => TextFormFieldWidget(
                            controller: _phoneNumberController,
                            hintText: S.of(context).phoneNumber,
                            isNumberNoOption: true,
                            errorMessageValidate: _errorValidateFieldPhoneNumber.value,
                            callBackOnChange: (value) => _errorValidateFieldPhoneNumber.value = AppHelper.validateFieldPhoneNumber(context, value),
                          ),
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                        ValueListenableBuilder(
                          valueListenable: _errorValidateFieldCurrentPassword,
                          builder: (_, value, __) => TextFormFieldWidget(
                            controller: _currentPasswordController,
                            hintText: S.of(context).password,
                            isPassword: true,
                            errorMessageValidate: _errorValidateFieldCurrentPassword.value,
                            callBackOnChange: (value) => _errorValidateFieldCurrentPassword.value = AppHelper.validateFieldPassword(context, value),
                          ),
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                        ValueListenableBuilder(
                          valueListenable: _errorValidateFieldNewPassword,
                          builder: (_, value, __) => TextFormFieldWidget(
                            controller: _newPasswordController,
                            hintText: S.of(context).newPassword,
                            isPassword: true,
                            errorMessageValidate: _errorValidateFieldNewPassword.value,
                            callBackOnChange: (value) {
                              _errorValidateFieldNewPassword.value = AppHelper.validateFieldPassword(context, value);
                              if (_errorValidateFieldConfirmNewPassword.value != '') {
                                _errorValidateFieldConfirmNewPassword.value = AppHelper.validateFieldConfirmPassword(context, value, _confirmNewPasswordController.text.trim());
                              }
                            },
                          ),
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                        ValueListenableBuilder(
                          valueListenable: _errorValidateFieldConfirmNewPassword,
                          builder: (_, value, __) => TextFormFieldWidget(
                            controller: _confirmNewPasswordController,
                            hintText: S.of(context).confirmNewPassword,
                            isPassword: true,
                            errorMessageValidate: _errorValidateFieldConfirmNewPassword.value,
                            callBackOnChange: (value) =>
                                _errorValidateFieldConfirmNewPassword.value = AppHelper.validateFieldConfirmPassword(context, _newPasswordController.text.trim(), value),
                          ),
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                          listenWhen: (previous, current) => current is ChangePasswordSuccessState || current is ChangePasswordFailState,
                          listener: (context, state) {
                            if (state is ChangePasswordSuccessState) {
                              Navigator.of(context).pop();
                              CustomFlushBar.showAlertFlushBar(context, state.message, isSuccess: true);
                            }
                            if (state is ChangePasswordFailState) {
                              CustomFlushBar.showAlertFlushBar(context, state.message);
                            }
                          },
                          buildWhen: (previous, current) => current is ChangePasswordSuccessState || current is ChangePasswordFailState || current is ChangePasswordLoadingState,
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                _errorValidateFieldPhoneNumber.value = AppHelper.validateFieldPhoneNumber(context, _phoneNumberController.text.trim());
                                _errorValidateFieldCurrentPassword.value = AppHelper.validateFieldPassword(context, _currentPasswordController.text.trim());
                                _errorValidateFieldNewPassword.value = AppHelper.validateFieldPassword(context, _newPasswordController.text.trim());
                                _errorValidateFieldConfirmNewPassword.value =
                                    AppHelper.validateFieldConfirmPassword(context, _newPasswordController.text.trim(), _confirmNewPasswordController.text.trim());
                                if (_errorValidateFieldPhoneNumber.value == '' &&
                                    _errorValidateFieldCurrentPassword.value == '' &&
                                    _errorValidateFieldNewPassword.value == '' &&
                                    _errorValidateFieldConfirmNewPassword.value == '' &&
                                    state is! ChangePasswordLoadingState) {
                                  context.read<AuthenticationBloc>().add(
                                        ChangePasswordEvent(
                                          username: _phoneNumberController.text.trim(),
                                          role: widget.userRole!,
                                          oldPassword: _currentPasswordController.text.trim(),
                                          password: _newPasswordController.text.trim(),
                                          passwordConfirmation: _confirmNewPasswordController.text.trim(),
                                        ),
                                      );
                                }
                              },
                              child: ButtonSubmitWidget(
                                title: S.of(context).changePassword,
                                widthButton: AppHelper.setMultiDeviceSize(context, 744.w * 52 / 100, 393.w * 76 / 100),
                                heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 70.h),
                                isShowLoading: state is ChangePasswordLoadingState,
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
            ],
          ),
        ),
      ),
    );
  }
}
