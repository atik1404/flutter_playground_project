import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool isLoading;

  // Sizing & Styling props
  final AppButtonSize size;
  final double? width;
  final double? maxWidth; // NEW: Caps the width
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
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
         type == AppButtonType.icon ? icon != null : true,
         'Icon data is required for Icon Button type',
       );

  // --- Factory Constructors ---

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
      borderRadius: borderRadius ?? BorderRadius.circular(8),
    );

    Color? bg;
    Color? fg;
    BorderSide? side;

    switch (type) {
      case AppButtonType.filled:
        bg = backgroundColor ?? Theme.of(context).primaryColor;
        fg = foregroundColor ?? Theme.of(context).colorScheme.onPrimary;
        break;
      case AppButtonType.outline:
        bg = Colors.transparent;
        fg = foregroundColor ?? Theme.of(context).primaryColor;
        side = BorderSide(color: fg);
        break;
      case AppButtonType.text:
      case AppButtonType.icon:
        bg = Colors.transparent;
        fg = foregroundColor ?? Theme.of(context).primaryColor;
        break;
    }

    final style = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) return Colors.grey.shade300;
        return bg;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) return Colors.grey.shade500;
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
              ? (foregroundColor ?? Theme.of(context).colorScheme.onPrimary)
              : (foregroundColor ?? Theme.of(context).primaryColor),
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
      return foregroundColor ?? Theme.of(context).colorScheme.onPrimary;
    }
    return foregroundColor ?? Theme.of(context).primaryColor;
  }
}

enum AppButtonType { filled, outline, text, icon }

enum AppButtonSize {
  small(32, 12, 12),
  medium(48, 24, 16),
  large(56, 32, 18);

  final double height;
  final double horizontalPadding;
  final double fontSize;

  const AppButtonSize(this.height, this.horizontalPadding, this.fontSize);
}
