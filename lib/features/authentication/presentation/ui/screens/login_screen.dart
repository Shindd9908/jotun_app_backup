import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:sizer/sizer.dart';

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

  void _resetDataErrorValidateTextField() {
    _phoneNumberController.text = '';
    _passwordController.text = 'benmautoandien';

    _errorValidateFieldPhoneNumber.value = '';
    _errorValidateFieldPassword.value = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundScreenFormFieldWidget(
        mainUIContent: Container(
          width: 100.w,
          height: 100.h - MediaQuery.of(context).viewInsets.bottom,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10.h, left: 32, right: 32),
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
                  text: S.of(context).login,
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
                  valueListenable: _errorValidateFieldPassword,
                  builder: (_, value, __) => TextFormFieldWidget(
                    controller: _passwordController,
                    hintText: S.of(context).password,
                    isPassword: true,
                    errorMessageValidate: _errorValidateFieldPassword.value,
                    callBackOnChange: (value) => _errorValidateFieldPassword.value = AppHelper.validateFieldPassword(context, value),
                  ),
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(12, 8)),
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
                      fontSize: AppHelper.setMultiDeviceSize(16.sp, 12.sp),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: AppHelper.setMultiDeviceSize(6.h, 4.h)),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listenWhen: (previous, current) => current is LoginSuccessState || current is LoginFailState,
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      Navigator.of(context).pushNamedAndRemoveUntil(AppPaths.confirmAccountInformationScreen, arguments: {'userInfo': state.userInfo}, (route) => false);
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
                        _errorValidateFieldPhoneNumber.value = AppHelper.validateFieldPhoneNumber(context, _phoneNumberController.text.trim());
                        _errorValidateFieldPassword.value = AppHelper.validateFieldPassword(context, _passwordController.text.trim());
                        if (_errorValidateFieldPhoneNumber.value == '' && _errorValidateFieldPhoneNumber.value == '' && state is! LoginLoadingState) {
                          context
                              .read<AuthenticationBloc>()
                              .add(LoginEvent(name: _phoneNumberController.text.trim(), password: _passwordController.text.trim(), roleUser: widget.userRole));
                        }
                      },
                      child: ButtonSubmitWidget(
                        title: S.of(context).login,
                        widthButton: 70.w,
                        isShowLoading: state is LoginLoadingState,
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
    );
  }
}
