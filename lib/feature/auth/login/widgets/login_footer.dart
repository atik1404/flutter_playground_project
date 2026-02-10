import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playground_flutter_project/common/logger/app_logger.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/designsystem/resources/app_icons.dart';
import 'package:playground_flutter_project/designsystem/resources/app_strings.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/button/app_filled_button.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacingSizes;
    final appColors = context.appColors;
    final textColors = context.textColors;
    final typography = context.typography;
    final iconSize = context.iconSizes;

    return Column(
      children: [
        AppFilledButton(
          label: AppStrings.actionHelp,
          backgroundColor: appColors.primary,
          leadingIcon: SvgPicture.asset(
            AppIcons.icPhone,
            width: iconSize.sm,
            height: iconSize.sm,
          ),
          onPressed: () {
            AppLogger.log("Help button pressed");
          },
        ),
        SpacerBox(height: spacing.xxl),
        SpacerBox(height: spacing.xxl),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              AppStrings.labelPoweredBy,
              style: typography.bodySmallLight,
              color: textColors.secondary,
            ),
            AppText(
              AppStrings.labelProtechSolution,
              style: typography.bodySmallSemiBold,
            ),
          ],
        ),
      ],
    );
  }
}
