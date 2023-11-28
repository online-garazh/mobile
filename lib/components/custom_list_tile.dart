import 'package:flutter/material.dart';
import 'package:mobile/components/notifications_widget.dart';
import 'package:mobile/components/spacers.dart';
import 'package:mobile/theme/custom_styles.dart';

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
  final bool hasNotification;
  final int newMessages;

  const CustomListTile({
    super.key,
    this.color = AppPalette.white70,
    required this.title,
    required this.onPressed,
    this.leading = const SizedBox.shrink(),
    this.trailing = const Icon(
      Icons.arrow_forward_ios_rounded,
      color: AppPalette.grey,
    ),
    this.titleStyle = AppPalette.font18w400,
    this.newMessagesStyle = AppPalette.font14w400,
    this.height = 64,
    this.hasNotification = false,
    this.newMessages = 0,
  })  : doubleLineTitle = false,
        header = '',
        headerStyle = const TextStyle();

  const CustomListTile.doubleLineTitle({
    super.key,
    this.color = AppPalette.white70,
    this.height = 90,
    required this.title,
    this.leading = const SizedBox.shrink(),
    this.trailing = const Icon(
      Icons.arrow_forward_ios_rounded,
      color: AppPalette.grey,
    ),
    required this.onPressed,
    required this.header,
    this.titleStyle = AppPalette.font18w400,
    this.headerStyle = AppPalette.font20w600,
    this.newMessagesStyle = AppPalette.font14w400,
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
        overlayColor: const MaterialStatePropertyAll(AppPalette.grey500),
        child: Container(
          color: color,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      Space.spaceW16,
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
                      Space.spaceW10,
                      hasNotification
                          ? const NotificationWidget()
                          : const SizedBox.shrink(),
                      newMessages > 0
                          ? NewMessagesWidget(
                              text: newMessages.toString(),
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
