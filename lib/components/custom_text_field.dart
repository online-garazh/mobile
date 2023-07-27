import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.title,
    this.isobscureText = false,
    required this.hintText,
    required this.errorText,
    this.isError = false,
    required this.controller,
    super.key,
  });

  final String title;
  final bool isobscureText;
  final String hintText;
  final String errorText;
  final bool isError;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          controller: controller,
          obscureText: isobscureText,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.black)),
            filled: false,
            contentPadding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            errorText: isError ? errorText : null,
          ),
        ),
      ],
    );
  }
}
