import 'package:flutter/material.dart';
import 'package:mobile/components/notifications_widget.dart';
import 'package:mobile/theme/custom_text_style.dart';
import 'package:mobile/theme/default_colors.dart';

class CustomListTile extends StatelessWidget {
  final Color color;
  final double height;
  final String title;
  final Widget leading;
  final Widget trailing;
  final VoidCallback onPressed;
  final bool doubleLineTitle;
  final String header;
  final TextStyle titleStyle;
  final TextStyle headerStyle;
  final TextStyle newMessagesStyle;
  final EdgeInsets padding;
  final bool hasNotification;
  final int newMessages;

  const CustomListTile({
    super.key,
    this.color = ColorPalette.white70,
    required this.title,
    required this.onPressed,
    this.leading = const SizedBox.shrink(),
    this.trailing = const Icon(
      Icons.arrow_forward_ios_rounded,
      color: ColorPalette.grey,
    ),
    this.titleStyle = AppPallete.font18w400,
    this.newMessagesStyle = AppPallete.font14w400,
    this.height = 64,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.hasNotification = false,
    this.newMessages = 0,
  })  : doubleLineTitle = false,
        header = '',
        headerStyle = const TextStyle();

  const CustomListTile.doubleLineTitle({
    super.key,
    this.color = ColorPalette.white70,
    this.height = 90,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    required this.title,
    this.leading = const SizedBox.shrink(),
    this.trailing = const Icon(
      Icons.arrow_forward_ios_rounded,
      color: ColorPalette.grey,
    ),
    required this.onPressed,
    required this.header,
    this.titleStyle = AppPallete.font18w400,
    this.headerStyle = AppPallete.font20w600,
    this.newMessagesStyle = AppPallete.font14w400,
    this.hasNotification = false,
    this.newMessages = 0,
  }) : doubleLineTitle = true;

  @override
  Widget build(BuildContext context) {
    final leadingSizeConstraints =
        doubleLineTitle ? Size.square(height * .55) : Size.square(height * .45);
    return Material(
      child: InkWell(
        onTap: onPressed,
        overlayColor: const MaterialStatePropertyAll(ColorPalette.grey500),
        child: Container(
          color: color,
          height: height,
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 10,
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height: leadingSizeConstraints.height,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        constraints:
                            BoxConstraints.tight(leadingSizeConstraints),
                        clipBehavior: Clip.hardEdge,
                        child: leading,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      doubleLineTitle
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  header,
                                  style: headerStyle,
                                  overflow: TextOverflow.visible,
                                ),
                                Text(
                                  title,
                                  style: titleStyle,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            )
                          : Text(
                              title,
                              style: titleStyle,
                              overflow: TextOverflow.visible,
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      hasNotification
                          ? const NotificationWidget()
                          : const SizedBox.shrink(),
                      newMessages > 0
                          ? NewMessagesWidget(
                              content: newMessages.toString(),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    trailing,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
