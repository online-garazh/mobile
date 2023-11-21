import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile/theme/custom_text_style.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.content,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  });
  final String content;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => log(content),
      padding: padding,
      child: SizedBox(
        child: Text(content, style: AppPallete.font18w400),
      ),
    );
  }
}
