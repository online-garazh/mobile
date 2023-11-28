import 'package:flutter/cupertino.dart';
import 'package:mobile/theme/custom_styles.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color = AppPalette.black,
  });
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: SizedBox(
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
