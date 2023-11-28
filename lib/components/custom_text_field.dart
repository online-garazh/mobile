import 'package:flutter/material.dart';
import 'package:mobile/theme/custom_text_style.dart';
import 'package:mobile/utils/extensions.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.errorText,
    required this.controller,
    this.height = 100.0,
    this.isPassword = false,
    this.isEmail = false,
    this.textStyle = AppPallete.font18w400,
    this.fillColor = Colors.white,
    this.cursorColor = Colors.black54,
    this.cursorWidth = 2,
    this.errorMaxLines = 2,
  });
  final String hintText;
  final String errorText;
  final double height;
  final bool isPassword;
  final bool isEmail;
  final TextStyle textStyle;
  final Color fillColor;
  final Color cursorColor;
  final TextEditingController controller;
  final double cursorWidth;
  final int errorMaxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscureText;
  final TextEditingController controller = TextEditingController();
  final bool hasError = true;
  @override
  void initState() {
    isObscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CustomTextField(
      :cursorWidth,
      :cursorColor,
      :controller,
      :fillColor,
      :isPassword,
      :height,
      :hintText,
      :textStyle,
      :errorMaxLines,
    ) = widget;
    return SizedBox(
      height: height,
      child: TextFormField(
        validator: _validator,
        cursorColor: cursorColor,
        cursorWidth: cursorWidth,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: isObscureText,
        style: textStyle,
        decoration: InputDecoration(
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () =>
                      setState(() => isObscureText = !isObscureText),
                  icon: isObscureText
                      ? const Icon((Icons.visibility_off_sharp))
                      : const Icon(Icons.visibility),
                  color: Colors.grey[600],
                )
              : null,
          fillColor: fillColor,
          errorMaxLines: errorMaxLines,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.4,
              color: Colors.black87,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54),
            borderRadius: BorderRadius.circular(6),
          ),
          hintText: hintText,
        ),
      ),
    );
  }

  String? _validator(String? val) {
    if (val == null) return widget.errorText;
    bool isValid = false;
    if (widget.isPassword) {
      isValid = val.isValidPassword;
    } else if (widget.isEmail) {
      isValid = val.isValidEmail;
    }
    return isValid ? null : widget.errorText;
  }
}
