import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/designsystem/resources/app_icons.dart';
import 'package:playground_flutter_project/designsystem/resources/app_strings.dart';
import 'package:playground_flutter_project/feature/trip/home/widgets/day_chip.dart';

class DaySelector extends StatelessWidget {
  const DaySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final backgroundColor = context.backgroundColors;
    final textColor = context.textColors;
    final borderColor = context.strokeColors;
    final spacing = context.spacingSizes;
    final shapes = context.shapeRadius;
    final iconSize = context.iconSizes;

    return Container(
      padding: AppSpacing.symmetric(
        horizontal: spacing.sm,
        vertical: spacing.md,
      ),
      decoration: BoxDecoration(
        color: appColors.onPrimary,
        borderRadius: BorderRadius.circular(shapes.lg),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Previous Day Button
          DayChip(
            label: AppStrings.labelPrevious,
            icon: AppIcons.icLeftArrawAngle,
            isActive: false,
            borderColor: borderColor.violet,
            textColor: textColor.violet,
            backgroundColor: backgroundColor.violet,
          ),

          // Today's Button
          DayChip(
            label: AppStrings.labelToday,
            icon: AppIcons.icHome,
            isActive: true,
            borderColor: borderColor.primary,
            textColor: textColor.primary,
            backgroundColor: backgroundColor.primary,
          ),

          // Next Day Button
          DayChip(
            label: AppStrings.labelNext,
            icon: AppIcons.icRightArrowAngle,
            isActive: false,
            isTrailingIcon: true,
            borderColor: borderColor.info,
            textColor: textColor.info,
            backgroundColor: backgroundColor.info,
          ),

          Container(
            padding: AppSpacing.all(spacing.xs),
            decoration: BoxDecoration(
              color: backgroundColor.violet,
              borderRadius: BorderRadius.circular(shapes.sm),
            ),
            child: SvgPicture.asset(
              AppIcons.icCalender,
              width: iconSize.md,
              height: iconSize.md,
            ),
          ),
        ],
      ),
    );
  }
}
