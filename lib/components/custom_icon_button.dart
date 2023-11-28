import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color = Colors.black,
    this.padding = EdgeInsets.zero,
  });
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: padding,
      child: SizedBox(
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
