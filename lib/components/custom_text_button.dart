import 'package:flutter/cupertino.dart';
import 'package:mobile/theme/custom_text_style.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  });
  final String title;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: padding,
      child: SizedBox(
        child: Text(title, style: AppPallete.font18w400),
      ),
    );
  }
}
