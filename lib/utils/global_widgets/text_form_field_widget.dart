import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/constants/constants.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? errorMessageValidate;
  final bool isPassword;
  final bool isEmail;
  final bool isReadOnly;
  final bool isNumberNoOption;
  final bool isNumberWithOptions;
  final Function? callBackOnChange;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.errorMessageValidate,
    this.isPassword = false,
    this.isEmail = false,
    this.isReadOnly = false,
    this.isNumberNoOption = false,
    this.isNumberWithOptions = false,
    this.callBackOnChange,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final _isShowValueFieldPassword = ValueNotifier<bool>(false);
  final _isFocusField = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 46,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColor.colorMainWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: AnimatedBuilder(
                animation: Listenable.merge([_isShowValueFieldPassword, _isFocusField]),
                builder: (_, __) {
                  return Focus(
                    onFocusChange: (hasFocus) {
                      _isFocusField.value = hasFocus;
                    },
                    child: TextFormField(
                      controller: widget.controller,
                      readOnly: widget.isReadOnly,
                      keyboardType: widget.isNumberWithOptions
                          ? const TextInputType.numberWithOptions(decimal: true, signed: true)
                          : widget.isNumberNoOption
                              ? const TextInputType.numberWithOptions()
                              : TextInputType.text,
                      obscureText: widget.isPassword ? !_isShowValueFieldPassword.value : false,
                      style: TextStyle(
                        color: AppColor.colorMainBlack,
                        fontSize: AppHelper.setMultiDeviceSize(14.sp, 14.sp),
                        fontWeight: FontWeight.w500,
                      ),
                      inputFormatters: widget.isEmail
                          ? [FilteringTextInputFormatter.allow(RegExp(Constants.allowEmailRegex))]
                          : widget.isNumberNoOption
                              ? [FilteringTextInputFormatter.allow(RegExp(Constants.allowOnlyNumberRegex))]
                              : null,
                      cursorHeight: 24,
                      cursorColor: AppColor.colorMainBlack,
                      decoration: InputDecoration(
                        labelText: widget.hintText,
                        labelStyle: TextStyle(
                          color: AppColor.colorMainGray,
                          fontSize: AppHelper.setMultiDeviceSize(12.sp, 12.sp),
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: AppColor.colorMainWhite,
                      ).copyWith(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: _isFocusField.value ? 16 : 8, bottom: 8, left: 14, right: 14),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColor.colorMainWhite, width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColor.colorMainWhite, width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        suffixIcon: widget.isPassword
                            ? InkWell(
                                onTap: () => _isShowValueFieldPassword.value = !_isShowValueFieldPassword.value,
                                child: Icon(
                                  !_isShowValueFieldPassword.value ? Icons.visibility_off : Icons.visibility,
                                  size: AppHelper.setMultiDeviceSize(28, 26),
                                  color: AppColor.colorMainBlack,
                                ),
                              )
                            : null,
                      ),
                      onChanged: (value) {
                        if (widget.callBackOnChange != null) {
                          widget.callBackOnChange!(value);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            if (widget.errorMessageValidate != null && widget.errorMessageValidate != "")
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: TextWidget(
                  text: widget.errorMessageValidate,
                  color: AppColor.colorMainRed,
                  fontSize: AppHelper.setMultiDeviceSize(10.sp, 10.sp),
                  fontWeight: FontWeight.w700,
                  maxLine: 2,
                  textAlign: TextAlign.start,
                ),
              ),
          ],
        ),
        if (widget.isReadOnly)
          Container(
            width: double.infinity,
            height: 46,
            color: Colors.transparent,
          ),
      ],
    );
  }
}
