import 'package:flutter/material.dart';
import 'package:mobile/theme/custom_styles.dart';

class NewMessagesWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const NewMessagesWidget({
    super.key,
    required this.text,
    this.textStyle = AppPalette.font14w400,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppPalette.red500,
      ),
      child: Text(
        text,
        style: textStyle.copyWith(color: AppPalette.white),
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
        color: AppPalette.blue600,
      ),
    );
  }
}
