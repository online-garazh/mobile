import 'package:flutter/cupertino.dart';
import 'package:mobile/theme/custom_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle = AppPalette.font18w600,
  });
  final String text;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: SizedBox(
        child: Text(text, style: textStyle),
      ),
    );
  }
}
