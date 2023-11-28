import 'package:flutter/material.dart';
import 'package:mobile/theme/custom_text_style.dart';
import 'package:mobile/theme/default_colors.dart';

class NewMessagesWidget extends StatelessWidget {
  final String content;
  final TextStyle textTheme;
  const NewMessagesWidget({
    super.key,
    required this.content,
    this.textTheme = AppPallete.font14w400,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorPalette.red500,
      ),
      child: Text(
        content,
        style: textTheme.copyWith(color: ColorPalette.white),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 9,
      height: 9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: ColorPalette.blueAccent,
      ),
    );
  }
}
