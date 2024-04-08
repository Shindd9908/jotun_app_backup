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
import 'package:jotub_app/utils/routers/paths.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController(text: 'benmautoandien');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _storeController = TextEditingController();
  final TextEditingController _identityCardNumberController = TextEditingController();

  final ValueNotifier _errorValidateFieldPhoneNumber = ValueNotifier<String>('');
  final ValueNotifier _errorValidateFieldPassword = ValueNotifier<String>('');
  final ValueNotifier _errorValidateFieldIdCardNumber = ValueNotifier<String>('');


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
              SizedBox(height: AppHelper.setMultiDeviceSize(context, 8, 8)),
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
                        TextWidget(
                          text: "Đăng ký tài khoản",
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
                        TextFormFieldWidget(
                          controller: _nameController,
                          hintText: S.of(context).fullName,
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                        TextFormFieldWidget(
                          controller: _storeController,
                          hintText: S.of(context).store,
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
                        ValueListenableBuilder(
                          valueListenable: _errorValidateFieldPassword,
                          builder: (_, value, __) => TextFormFieldWidget(
                            controller: _passwordController,
                            hintText: S.of(context).password,
                            isPassword: true,
                            errorMessageValidate: _errorValidateFieldPassword.value,
                            callBackOnChange: (value) => _errorValidateFieldPassword.value = AppHelper.validateFieldPassword(context, value),
                          ),
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 32.h, 24.h)),
                        ValueListenableBuilder(
                          valueListenable: _errorValidateFieldPassword,
                          builder: (_, value, __) => TextFormFieldWidget(
                            controller: _passwordController,
                            hintText: "Xác nhận mật khẩu",
                            isPassword: true,
                            errorMessageValidate: _errorValidateFieldPassword.value,
                            callBackOnChange: (value) => _errorValidateFieldPassword.value = AppHelper.validateFieldPassword(context, value),
                          ),
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 36.h, 26.h)),
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                          listenWhen: (previous, current) => current is RegisterSuccessState || current is RegisterFailState,
                          listener: (context, state) {
                            if (state is RegisterSuccessState) {
                              Navigator.of(context).popAndPushNamed(AppPaths.loginScreen, arguments: {'userRole': 3});
                              CustomFlushBar.showAlertFlushBar(context, "Đăng ký thành công, vui lòng chờ hệ thống xác nhận.", isSuccess: true);
                            }
                          },
                          buildWhen: (previous, current) => current is RegisterSuccessState || current is RegisterFailState || current is RegisterLoadingState,
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                _errorValidateFieldPhoneNumber.value = AppHelper.validateFieldPhoneNumber(context, _phoneNumberController.text.trim());
                                _errorValidateFieldPassword.value = AppHelper.validateFieldPassword(context, _passwordController.text.trim());
                                _errorValidateFieldIdCardNumber.value = AppHelper.validateFieldPassword(context, _identityCardNumberController.text.trim());
                                if (_errorValidateFieldPhoneNumber.value == '' &&
                                    _errorValidateFieldPhoneNumber.value == '' &&
                                    _errorValidateFieldPhoneNumber.value == '' &&
                                    state is! RegisterLoadingState) {
                                  context.read<AuthenticationBloc>().add(RegisterEvent());
                                }
                              },
                              child: ButtonSubmitWidget(
                                title: "Đăng ký",
                                widthButton: AppHelper.setMultiDeviceSize(context, 744.w * 52 / 100, 393.w * 76 / 100),
                                heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 70.h),
                                isShowLoading: state is RegisterLoadingState,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
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
