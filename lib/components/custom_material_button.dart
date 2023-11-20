import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    this.height = 60.0,
    required this.onPressed,
  });
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      clipBehavior: Clip.hardEdge,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        color: Colors.black,
        clipBehavior: Clip.hardEdge,
        child: const Text(
          'Увійти',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
