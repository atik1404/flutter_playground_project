import 'package:flutter/material.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';

/// A customizable button widget that supports various styles and states.
///
/// [AppButton] wraps Flutter's button widgets (ElevatedButton, OutlinedButton, TextButton)
/// providing a unified interface for styling and behavior across the app.
class AppButton extends StatelessWidget {
  /// The text label to display on the button.
  final String? label;

  /// The icon to display. Required for [AppButtonType.icon].
  final IconData? icon;

  /// An optional widget to display before the label.
  final Widget? leadingIcon;

  /// An optional widget to display after the label.
  final Widget? trailingIcon;

  /// callback when the button is pressed. If null, the button is disabled.
  final VoidCallback? onPressed;

  /// The style type of the button (filled, outline, text, icon).
  final AppButtonType type;

  /// Whether to show a loading indicator instead of the button content.
  final bool isLoading;

  // Sizing & Styling props

  /// The size variant of the button.
  final AppButtonSize size;

  /// Explicit width for the button.
  final double? width;

  /// Maximum width for the button.
  final double? maxWidth;

  /// Explicit height for the button. Overrides [size.height] if provided.
  final double? height;

  /// Custom background color. Falls back to theme defaults if null.
  final Color? backgroundColor;

  /// Custom foreground color (text/icon). Falls back to theme defaults if null.
  final Color? foregroundColor;

  /// Custom border radius. Defaults to 8.0.
  final BorderRadiusGeometry? borderRadius;

  const AppButton({
    super.key,
    this.label,
    this.onPressed,
    this.type = AppButtonType.filled,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.icon,
    this.width,
    this.maxWidth,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  }) : assert(
         type != AppButtonType.icon || icon != null,
         'Icon data is required for Icon Button type',
       );

  // --- Factory Constructors ---

  /// Creates a filled button (ElevatedButton style).
  const AppButton.filled({
    super.key,
    required String this.label,
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
  }) : type = AppButtonType.filled,
       icon = null;

  /// Creates an outlined button (OutlinedButton style).
  const AppButton.outline({
    super.key,
    required String this.label,
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
  }) : type = AppButtonType.outline,
       icon = null;

  /// Creates a text button (TextButton style).
  const AppButton.text({
    super.key,
    required String this.label,
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
  }) : type = AppButtonType.text,
       icon = null;

  /// Creates an icon-only button.
  const AppButton.icon({
    super.key,
    required IconData this.icon,
    required this.onPressed,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.width,
    this.maxWidth,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  }) : type = AppButtonType.icon,
       label = null,
       leadingIcon = null,
       trailingIcon = null;

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height ?? size.height;
    final isEnabled = onPressed != null && !isLoading;
    final effectiveOnPressed = isEnabled ? onPressed : null;

    // 1. Build the Button Widget
    final Widget button = SizedBox(
      height: effectiveHeight,
      width: width, // Applies preferred width (e.g., double.infinity)
      child: _buildSpecificButton(
        context,
        effectiveOnPressed,
        _buildContent(context, effectiveHeight),
      ),
    );

    // 2. Handle Max Width Constraints
    if (maxWidth != null) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth!),
          child: button,
        ),
      );
    }

    return button;
  }

  Widget _buildSpecificButton(
    BuildContext context,
    VoidCallback? onPressed,
    Widget child,
  ) {
    // Common Style Logic
    final shape = RoundedRectangleBorder(
      borderRadius:
          borderRadius ?? BorderRadius.circular(context.shapeRadius.sm),
    );

    Color? bg;
    Color? fg;
    BorderSide? side;

    switch (type) {
      case AppButtonType.filled:
        bg = backgroundColor ?? context.buttonColors.primary;
        fg = foregroundColor ?? context.buttonColors.onPrimary;
        break;
      case AppButtonType.outline:
        bg = Colors.transparent;
        fg = foregroundColor ?? context.buttonColors.onOutline;
        side = BorderSide(color: context.buttonColors.outline);
        break;
      case AppButtonType.text:
      case AppButtonType.icon:
        bg = Colors.transparent;
        fg = foregroundColor ?? context.appColors.primary;
        break;
    }

    final style = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return context.buttonColors.disableContainer;
        }
        
        return bg;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return context.buttonColors.disable;
        }
       
        return fg;
      }),
      side: WidgetStateProperty.all(side),
      shape: WidgetStateProperty.all(shape),
      elevation: WidgetStateProperty.all(type == AppButtonType.filled ? 2 : 0),
      padding: WidgetStateProperty.all(
        type == AppButtonType.icon
            ? EdgeInsets.zero
            : EdgeInsets.symmetric(horizontal: size.horizontalPadding),
      ),
    );

    switch (type) {
      case AppButtonType.filled:
        return ElevatedButton(onPressed: onPressed, style: style, child: child);
      case AppButtonType.outline:
        return OutlinedButton(onPressed: onPressed, style: style, child: child);
      case AppButtonType.text:
      case AppButtonType.icon:
        return TextButton(onPressed: onPressed, style: style, child: child);
    }
  }

  Widget _buildContent(BuildContext context, double effectiveHeight) {
    if (isLoading) {
      final loaderSize = effectiveHeight * 0.5;
      
      return SizedBox(
        height: loaderSize,
        width: loaderSize,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: type == AppButtonType.filled
              ? (foregroundColor ?? context.buttonColors.onPrimary)
              : (foregroundColor ?? context.appColors.primary),
        ),
      );
    }

    if (type == AppButtonType.icon) {
      return Icon(icon, size: size.fontSize * 1.5);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadingIcon != null) ...[
          IconTheme(
            data: IconThemeData(
              size: size.fontSize * 1.2,
              color: currentColor(context),
            ),
            child: leadingIcon!,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          label!,
          style: TextStyle(
            fontSize: size.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (trailingIcon != null) ...[
          const SizedBox(width: 8),
          IconTheme(
            data: IconThemeData(
              size: size.fontSize * 1.2,
              color: currentColor(context),
            ),
            child: trailingIcon!,
          ),
        ],
      ],
    );
  }

  Color currentColor(BuildContext context) {
    if (type == AppButtonType.filled) {
      return foregroundColor ?? context.buttonColors.onPrimary;
    }
    
    return foregroundColor ?? context.appColors.primary;
  }
}

/// Defines the visual style of the button.
enum AppButtonType { filled, outline, text, icon }

/// Defines the size variants of the button.
enum AppButtonSize {
  small(32, 12, 12),
  medium(48, 24, 16),
  large(56, 32, 18);

  final double height;
  final double horizontalPadding;
  final double fontSize;

  const AppButtonSize(this.height, this.horizontalPadding, this.fontSize);
}
