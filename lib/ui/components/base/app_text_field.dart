import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';

/// A customizable text field widget that maintains consistent styling across the app.
///
/// This widget wraps Flutter's [TextFormField] with predefined styling and additional
/// functionality. It supports various customization options including border styling,
/// input formatting, and text styling.
///
/// Example usage:
/// ```dart
/// AppTextField(
///   hintText: 'Enter your name',
///   prefixIcon: Icon(Icons.person),
///   onChanged: (value) => print(value),
/// )
/// ```
class AppTextField extends StatefulWidget {
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
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final bool isFillColorEnabled;
  final FocusNode? focusNode;

  /// Creates an [AppTextField] widget.
  ///
  /// Parameters:
  /// - [controller]: Controls the text being edited.
  /// - [hintText]: Placeholder text shown when the field is empty.
  /// - [labelText]: Text that describes the input field.
  /// - [obscureText]: If true, the text will be hidden (used for passwords).
  /// - [keyboardType]: The type of keyboard to use for editing the text.
  /// - [textInputAction]: The action button to show on the keyboard.
  /// - [onChanged]: Called when the user changes the text in the field.
  /// - [inputFormatters]: Optional input formatters to change/validate input.
  /// - [maxLines]: The maximum number of lines for the text field.
  /// - [maxLength]: The maximum number of characters allowed in the text field.
  /// - [prefixIcon]: An icon to show before the input area.
  /// - [suffixIcon]: An icon to show after the input area.
  /// - [prefixIconConstraints]: Constraints for prefix icon.
  /// - [suffixIconConstraints]: Constraints for suffix icon.
  /// - [borderColor]: The color of the border. Falls back to theme color if null.
  /// - [borderRadius]: The radius of the border corners.
  /// - [contentPadding]: The padding around the content of the text field.
  /// - [enabled]: Whether the text field is interactive.
  const AppTextField({
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
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.borderColor,
    this.borderRadius = 15.0,
    this.contentPadding,
    this.enabled = true,
    this.isFillColorEnabled = true,
    this.focusNode,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  // ... existing code ...

  @override
  Widget build(BuildContext context) {
    final lineSizes = context.lineSizes;
    final padding = AppSpacing.all(context.spacingSizes.md);

    return TextFormField(
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      obscureText: widget.obscureText,
      // ... existing properties ...
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: context.typography.bodySmallLight.copyWith(
          color: context.textFieldColors.hint,
        ),
        // ... existing properties ...
        prefixIcon: widget.prefixIcon != null
            ? Padding(padding: padding, child: widget.prefixIcon)
            : null,
        suffixIcon: widget.suffixIcon != null
            ? Padding(padding: padding, child: widget.suffixIcon)
            : null,
        prefixIconConstraints: widget.prefixIconConstraints,
        suffixIconConstraints: widget.suffixIconConstraints,
        // ...
        //contentPadding: widget.contentPadding,
        fillColor: context.textFieldColors.fill,
        filled: widget.isFillColorEnabled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor ?? context.textFieldColors.enabledBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor ?? context.textFieldColors.enabledBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor ?? context.textFieldColors.focusedBorder,
            width: lineSizes.thin,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: context.textFieldColors.errorBorder),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: context.textFieldColors.errorBorder,
            width: lineSizes.thin,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: context.textFieldColors.disabledBorder),
        ),
        counterText: '',
      ),
    );
  }
}
