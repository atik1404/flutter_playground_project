import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/designsystem/resources/app_icons.dart';
import 'package:playground_flutter_project/feature/trip/home/widgets/day_selector.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class HomeToolbar extends StatelessWidget {
  const HomeToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final iconSizes = context.iconSizes;
    final spacing = context.spacingSizes;
    final shapes = context.shapeRadius;
    final typography = context.typography;

    // Estimated half-height of the DaySelector for the overlap calculation.
    // Adjust this value if the selector is taller/shorter.
    final double overlapOffset = spacing.xl;

    return Stack(
      // 1. Allow the DaySelector to hang "outside" the Container's bounds
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // 2. The Blue Toolbar Background
        Container(
          color: appColors.primary,
          width: double.infinity,
          padding: AppSpacing.only(
            start: spacing.md,
            end: spacing.md,
            top: spacing.lg,
            // Add extra bottom padding so the "Top Half" of the selector
            // has blue background behind it.
            bottom: spacing.lg + overlapOffset,
          ),
          child: Row(
            children: [
              // Start Icon
              SvgPicture.asset(
                AppIcons.icDrawerMenu,
                width: iconSizes.md,
                height: iconSizes.md,
              ),

              // Profile Section (Centered)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: shapes.sm,
                      child: AppText(
                        "H",
                        style: typography.bodyMediumSemiBold.copyWith(
                          color: appColors.onPrimary,
                        ),
                      ),
                    ),
                    SizedBox(width: spacing.sm),
                    Flexible(
                      child: AppText(
                        "Hanif North Counter",
                        style: typography.bodyMediumSemiBold,
                        color: appColors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              // End Icons
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppIcons.icSearch,
                    width: iconSizes.md,
                    height: iconSizes.md,
                  ),
                  SpacerBox(width: spacing.md),
                  SvgPicture.asset(
                    AppIcons.icFilter,
                    width: iconSizes.sm,
                    height: iconSizes.sm,
                  ),
                ],
              ),
            ],
          ),
        ),

        // 3. The Overlapped Day Selector
        Positioned(
          // Move it down by the offset amount to create the overlap effect
          bottom: -overlapOffset,
          left: spacing.md,
          right: spacing.md,
          child: const DaySelector(),
        ),
      ],
    );
  }
}
