import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/base/app_text_field.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

/// A filled text field widget that uses [AppTextField] with a filled background.
class AppFilledTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final FocusNode? focusNode;

  const AppFilledTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.borderColor,
    this.borderRadius = 15.0,
    this.contentPadding,
    this.enabled = true,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacingSizes;
    final typography = context.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          AppText(labelText!, style: typography.bodySmallLight),
          SpacerBox(height: spacing.sm),
        ],
        AppTextField(
          controller: controller,
          hintText: hintText,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          maxLength: maxLength,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconConstraints: prefixIconConstraints,
          suffixIconConstraints: suffixIconConstraints,
          borderColor: borderColor,
          errorText: errorText,
          borderRadius: borderRadius,
          contentPadding: contentPadding,
          enabled: enabled,
          focusNode: focusNode,
        ),
      ],
    );
  }
}
