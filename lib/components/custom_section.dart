import 'package:flutter/material.dart';
import 'package:mobile/theme/custom_text_style.dart';
import 'package:mobile/theme/default_colors.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    this.children = const [],
    this.color,
    this.sectionTitle,
    this.height,
    this.width,
    this.withDividers = false,
    this.titlePadding = const EdgeInsets.only(left: 16, bottom: 8),
    this.titleStyle = AppPallete.font18w600DGrey,
  });
  final Color? color;
  final List<Widget> children;
  final double? width;
  final double? height;
  final String? sectionTitle;
  final bool withDividers;
  final EdgeInsets titlePadding;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle != null
              ? Padding(
                  padding: titlePadding,
                  child: Text(sectionTitle!, style: titleStyle),
                )
              : const SizedBox.shrink(),
          ColoredBox(
            color: color ?? ColorPalette.white,
            child: Column(
              children: [
                for (int i = 0; i < children.length; i++) ...[
                  children[i],
                  if (withDividers && i != children.length - 1)
                    const Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: .5,
                      height: 0,
                    ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
