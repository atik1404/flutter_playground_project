import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playground_flutter_project/ui/components/base/app_text_field.dart';

/// A filled text field widget that uses [AppTextField] with a filled background.
class AppFilledTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final bool enabled;
  final FocusNode? focusNode;

  const AppFilledTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.borderRadius = 15.0,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
    this.enabled = true,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: hintText,
      labelText: labelText,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      maxLength: maxLength,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      borderColor: borderColor,
      borderRadius: borderRadius,
      contentPadding: contentPadding,
      enabled: enabled,
      focusNode: focusNode,
    );
  }
}
