import 'package:flutter/material.dart';
import 'package:mobile/theme/custom_styles.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    this.height = 60.0,
    required this.onPressed,
    required this.color,
    this.textStyle = AppPalette.font18w400,
    required this.text,
  });
  final String text;
  final double height;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle textStyle;

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
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
