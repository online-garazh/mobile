import 'package:flutter/material.dart';
import 'package:mobile/theme/custom_styles.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    this.children = const [],
    this.color,
    this.sectionTitle,
    this.height,
    this.width,
    this.withDividers = false,
    this.titleStyle = AppPalette.font18w600,
  });
  final Color? color;
  final List<Widget> children;
  final double? width;
  final double? height;
  final String? sectionTitle;
  final bool withDividers;
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
                  padding: const EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(
                    sectionTitle!,
                    style: titleStyle.copyWith(color: AppPalette.black54),
                  ),
                )
              : const SizedBox.shrink(),
          ColoredBox(
            color: color ?? AppPalette.white,
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
