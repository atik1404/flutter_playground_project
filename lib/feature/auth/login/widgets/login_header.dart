import 'package:flutter/material.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/designsystem/resources/app_strings.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacingSizes;
    final typography = context.typography; // Added
    final textColors = context.textColors; // Added

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(AppStrings.titleTiko, style: typography.titleLargeBold),
        SpacerBox(height: spacing.sm),
        AppText(
          AppStrings.labelAllRightsReserved,
          style: typography.bodySmallMedium,
          color: textColors.secondary,
        ),
        SpacerBox(height: spacing.xxl),
        AppText(AppStrings.titleWelcomeBack, style: typography.titleMediumBold),
        SpacerBox(height: spacing.sm),
        AppText(
          AppStrings.titleSignToContinue,
          style: typography.bodySmallMedium,
          color: textColors.secondary,
        ),
      ],
    );
  }
}
