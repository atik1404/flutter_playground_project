import 'package:flutter/material.dart';
import 'package:playground_flutter_project/ui/components/base/app_button.dart';

/// An icon-only button widget that uses [AppButton.icon].
class AppIconButton extends StatelessWidget {
  /// The icon to display.
  final IconData icon;

  /// Callback when the button is pressed. If null, the button is disabled.
  final VoidCallback? onPressed;

  /// The size variant of the button. Defaults to [AppButtonSize.medium].
  final AppButtonSize size;

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

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = AppButtonSize.medium,
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
    return AppButton.icon(
      icon: icon,
      onPressed: onPressed,
      size: size,
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
