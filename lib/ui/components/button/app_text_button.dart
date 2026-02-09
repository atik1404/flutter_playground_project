import 'package:flutter/material.dart';
import 'package:playground_flutter_project/ui/components/base/app_button.dart';

/// A text button widget that uses [AppButton.text].
class AppTextButton extends StatelessWidget {
  /// The text label to display on the button.
  final String label;

  /// Callback when the button is pressed. If null, the button is disabled.
  final VoidCallback? onPressed;

  /// The size variant of the button. Defaults to [AppButtonSize.medium].
  final AppButtonSize size;

  /// An optional widget to display before the label.
  final Widget? leadingIcon;

  /// An optional widget to display after the label.
  final Widget? trailingIcon;

  /// Whether to show a loading indicator.
  final bool isLoading;

  /// Explicit width for the button.
  final double? width;

  /// Maximum width for the button.
  final double? maxWidth;

  /// Explicit height for the button.
  final double? height;

  /// Custom background color.
  final Color? backgroundColor;

  /// Custom foreground color.
  final Color? foregroundColor;

  /// Custom border radius.
  final BorderRadiusGeometry? borderRadius;

  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = AppButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.width,
    this.maxWidth,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton.text(
      label: label,
      onPressed: onPressed,
      size: size,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      width: width,
      maxWidth: maxWidth,
      height: height,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      borderRadius: borderRadius,
    );
  }
}
