import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.content, required this.onPressed});
  final String content;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: const MaterialStatePropertyAll(Colors.black12),
        backgroundColor: const MaterialStatePropertyAll(Colors.white10),
        padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12, horizontal: 8)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      child: Text(
        content,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
