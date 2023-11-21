import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    this.height = 60.0,
    required this.onPressed,
    required this.color,
    required this.textTheme,
  });
  final double height;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      clipBehavior: Clip.hardEdge,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        color: color,
        clipBehavior: Clip.hardEdge,
        child: Text(
          'Увійти',
          style: textTheme,
        ),
      ),
    );
  }
}
