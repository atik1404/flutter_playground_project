import 'package:flutter/material.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/designsystem/resources/app_animation.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/button/app_outline_button.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';
import 'package:lottie/lottie.dart';

class ErrorUi extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  const ErrorUi({super.key, required this.errorMessage, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final spacingSize = context.spacingSizes;

    final mediaQuery = MediaQuery.of(context);

    return Container(
      padding: AppSpacing.symmetric(horizontal: spacingSize.lg),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(height: spacingSize.xl),
          Lottie.asset(
            AppAnimation.networkError,
            height: mediaQuery.size.height * 0.30,
            width: mediaQuery.size.width * 0.5,
            fit: BoxFit.contain,
            repeat: true,
          ),
          SpacerBox(height: spacingSize.xl),
          Column(
            children: [
              AppText(
                textAlign: TextAlign.center,
                "Something went wrong",
                style: context.typography.titleSmallBold,
                color: context.textColors.error,
              ),
              SpacerBox(height: spacingSize.lg),
              AppText(
                maxLines: 2,
                textAlign: TextAlign.center,
                errorMessage,
                style: context.typography.bodyMediumLight,
              ),
              SpacerBox(height: spacingSize.lg),
              AppOutlineButton(
                label: "Retry",
                width: double.infinity,
                onPressed: onRetry,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
