import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/designsystem/resources/app_icons.dart';
import 'package:playground_flutter_project/designsystem/resources/app_strings.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/button/app_filled_button.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';
import 'package:playground_flutter_project/ui/components/textfield/app_filled_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacingSizes;
    final appColors = context.appColors;
    final typography = context.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(AppStrings.labelEmailAddress, style: typography.bodySmallLight),
        SpacerBox(height: spacing.sm),
        AppFilledTextField(
          controller: _emailController,
          hintText: AppStrings.hintEmailAddress,
          suffixIcon: SvgPicture.asset(AppIcons.icEmail),
          keyboardType: TextInputType.emailAddress,
        ),
        SpacerBox(height: spacing.lg),
        AppText(AppStrings.labelPassword, style: typography.bodySmallLight),
        SpacerBox(height: spacing.sm),
        AppFilledTextField(
          controller: _passwordController,
          hintText: AppStrings.hintPassword,
          obscureText: _obscurePassword,
          suffixIcon: GestureDetector(
            onTap: () => setState(() => _obscurePassword = !_obscurePassword),
            child: SvgPicture.asset(AppIcons.icPasswordVisible),
          ),
          textInputAction: TextInputAction.done,
        ),
        SpacerBox(height: spacing.lg),
        SpacerBox(height: spacing.lg),
        AppFilledButton(
          label: AppStrings.actionSignIn,
          width: double.infinity,
          backgroundColor: appColors.primary,
          onPressed: () {},
        ),
      ],
    );
  }
}
