import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotub_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/custom_flush_bar.dart';
import 'package:jotub_app/utils/global_widgets/text_form_field_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

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
      body: Container(
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10.h, left: 32, right: 32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgBackgroundPage),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.imgLogoApp,
                width: AppHelper.setMultiDeviceSize(40.w, 40.w),
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: AppHelper.setMultiDeviceSize(12.h, 10.h)),
              TextWidget(
                text: S.of(context).changePassword,
                color: AppColor.colorMainWhite,
                fontSize: AppHelper.setMultiDeviceSize(26.sp, 22.sp),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: AppHelper.setMultiDeviceSize(24, 24)),
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
              SizedBox(height: AppHelper.setMultiDeviceSize(24, 24)),
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
              SizedBox(height: AppHelper.setMultiDeviceSize(24, 24)),
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
              SizedBox(height: AppHelper.setMultiDeviceSize(24, 24)),
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
              SizedBox(height: AppHelper.setMultiDeviceSize(24, 24)),
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
                      widthButton: 70.w,
                      isShowLoading: state is ChangePasswordLoadingState,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
