import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class DayChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final String icon;
  final bool isTrailingIcon;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;

  const DayChip({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
    this.isTrailingIcon = false,
    required this.borderColor,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final iconSizes = context.iconSizes;
    final spacing = context.spacingSizes;
    final shapes = context.shapeRadius;
    final typography = context.typography;

    return Container(
      padding: AppSpacing.symmetric(
        horizontal: spacing.md,
        vertical: spacing.sm,
      ),
      decoration: BoxDecoration(
        color: isActive ? context.appColors.primary : backgroundColor,
        borderRadius: BorderRadius.circular(shapes.full),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          if (!isTrailingIcon) ...[
            SvgPicture.asset(icon, width: iconSizes.xxs, height: iconSizes.xxs),

            SpacerBox(width: spacing.sm),
          ],
          AppText(
            label,
            style: typography.bodyExtraSmallSemiBold,
            color: isActive ? context.appColors.onPrimary : textColor,
          ),
          if (isTrailingIcon) ...[
            SpacerBox(width: spacing.sm),
            SvgPicture.asset(icon, width: iconSizes.xxs, height: iconSizes.xxs),
          ],
        ],
      ),
    );
  }
}
