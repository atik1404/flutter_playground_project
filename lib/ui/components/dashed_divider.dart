import 'package:flutter/material.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';

class DashedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color? color;

  const DashedDivider({
    super.key,
    this.height = 1,
    this.dashWidth = 5.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (2 * dashWidth)).floor();

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color ?? context.appColors.primaryContainer,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
