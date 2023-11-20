import 'package:flutter/material.dart';
import 'package:mobile/utils/extensions.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.height = 60.0,
    this.isPassword = false,
    required this.controller,
  });
  final String hintText;
  final double height;
  final bool isPassword;
  final TextEditingController controller;

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
    const fontSizeValue = 18.0;

    return SizedBox(
      height: 100,
      child: TextFormField(
        validator: _validator,
        cursorColor: Colors.black54,
        cursorWidth: 2,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: isObscureText,
        style: const TextStyle(fontSize: fontSizeValue),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () =>
                      setState(() => isObscureText = !isObscureText),
                  icon: isObscureText
                      ? const Icon((Icons.visibility_off_sharp))
                      : const Icon(Icons.visibility),
                  color: Colors.grey[600],
                )
              : null,
          fillColor: Colors.white,
          errorMaxLines: 2,
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
          hintText: widget.hintText,
        ),
      ),
    );
  }

  String? _validator(String? val) {
    switch (widget.isPassword) {
      case true:
        if (val != null && !val.isValidPassword) {
          return 'Enter valid Password';
        } else {
          return null;
        }
      case false:
        if (val != null && !val.isValidEmail) {
          return 'Enter valid Email';
        } else {
          return null;
        }
      default:
        return null;
    }
  }
}
