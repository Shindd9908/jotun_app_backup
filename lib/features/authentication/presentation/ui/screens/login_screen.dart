import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/core/preferences/shared_preferences_manager.dart';
import 'package:jotub_app/di/dependency_injection.dart';
import 'package:jotub_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:jotub_app/features/authentication/presentation/cubit/firebase_token_cubit.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/constants/key_preferences.dart';
import 'package:jotub_app/utils/global_widgets/background_screen_form_field_widget.dart';
import 'package:jotub_app/utils/global_widgets/button_submit_widget.dart';
import 'package:jotub_app/utils/global_widgets/custom_flush_bar.dart';
import 'package:jotub_app/utils/global_widgets/text_form_field_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';

class LoginScreen extends StatefulWidget {
  final int? userRole;

  const LoginScreen({super.key, this.userRole});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController(text: 'benmautoandien');

  final ValueNotifier _errorValidateFieldPhoneNumber = ValueNotifier<String>('');
  final ValueNotifier _errorValidateFieldPassword = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    context.read<FirebaseTokenCubit>().checkAndGenerateDeviceToken();
  }

  void _resetDataErrorValidateTextField() {
    _phoneNumberController.text = '';
    _passwordController.text = 'benmautoandien';

    _errorValidateFieldPhoneNumber.value = '';
    _errorValidateFieldPassword.value = '';
  }

  @override
  Widget build(BuildContext context) {
    final sharedPreference = getIt<SharedPreferencesManager>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundScreenFormFieldWidget(
        mainUIContent: Container(
          width: AppHelper.setMultiDeviceSize(context, 744.w, 393.w),
          height:
              AppHelper.setMultiDeviceSize(context, 1133.h, 852.h) - MediaQuery.of(context).viewInsets.bottom - MediaQuery.of(context).padding.top,
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
              SizedBox(height: AppHelper.setMultiDeviceSize(context, 8.h, 8.h)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: AppHelper.setMultiDeviceSize(context, 70.h, 48.h),
                    left: AppHelper.setMultiDeviceSize(context, 744.w / 12, 0),
                    right: AppHelper.setMultiDeviceSize(context, 744.w / 12, 0),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppAssets.imgLogoApp,
                          width: AppHelper.setMultiDeviceSize(context, 744.w * 35 / 100, 393.w * 40 / 100),
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 100.h, 60.h)),
                        TextWidget(
                          text: S.of(context).login,
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
                          valueListenable: _errorValidateFieldPassword,
                          builder: (_, value, __) => TextFormFieldWidget(
                            controller: _passwordController,
                            hintText: S.of(context).password,
                            isPassword: true,
                            errorMessageValidate: _errorValidateFieldPassword.value,
                            callBackOnChange: (value) => _errorValidateFieldPassword.value = AppHelper.validateFieldPassword(context, value),
                          ),
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 16.h, 8.h)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              _resetDataErrorValidateTextField();
                              Navigator.of(context).pushNamed(AppPaths.changePasswordScreen, arguments: {'userRole': widget.userRole});
                            },
                            child: TextWidget(
                              text: S.of(context).changePassword,
                              color: AppColor.colorMainWhite,
                              fontSize: AppHelper.setMultiDeviceSize(context, 20.sp, 12.sp),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: AppHelper.setMultiDeviceSize(context, 36.h, 26.h)),
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                          listenWhen: (previous, current) => current is LoginSuccessState || current is LoginFailState,
                          listener: (context, state) {
                            if (state is LoginSuccessState) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppPaths.confirmAccountInformationScreen, arguments: {'userInfo': state.userInfo}, (route) => false);
                              CustomFlushBar.showAlertFlushBar(context, state.message, isSuccess: true);
                            }
                            if (state is LoginFailState) {
                              CustomFlushBar.showAlertFlushBar(context, state.message);
                            }
                          },
                          buildWhen: (previous, current) => current is LoginSuccessState || current is LoginFailState || current is LoginLoadingState,
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                _errorValidateFieldPhoneNumber.value =
                                    AppHelper.validateFieldPhoneNumber(context, _phoneNumberController.text.trim());
                                _errorValidateFieldPassword.value = AppHelper.validateFieldPassword(context, _passwordController.text.trim());
                                if (_errorValidateFieldPhoneNumber.value == '' &&
                                    _errorValidateFieldPhoneNumber.value == '' &&
                                    state is! LoginLoadingState) {
                                  context.read<AuthenticationBloc>().add(
                                        LoginEvent(
                                          name: _phoneNumberController.text.trim(),
                                          password: _passwordController.text.trim(),
                                          deviceToken: sharedPreference.getValue(KeyPreferences.kDeviceToken) ?? 'test',
                                          roleUser: widget.userRole!,
                                        ),
                                      );
                                }
                              },
                              child: ButtonSubmitWidget(
                                title: S.of(context).login,
                                widthButton: AppHelper.setMultiDeviceSize(context, 744.w * 52 / 100, 393.w * 76 / 100),
                                heightButton: AppHelper.setMultiDeviceSize(context, 96.h, 70.h),
                                isShowLoading: state is LoginLoadingState,
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
