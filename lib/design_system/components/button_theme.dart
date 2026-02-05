import 'package:flutter/material.dart';
import 'component_spec.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_typography.dart';

@immutable
class AppButtonExtension extends ThemeExtension<AppButtonExtension> {
  final TokenBundle primary;
  final TokenBundle secondary;
  final TokenBundle outline;
  final TokenBundle ghost;
  final TokenBundle destructive;
  final TokenBundle disabled;

  const AppButtonExtension({
    required this.primary,
    required this.secondary,
    required this.outline,
    required this.ghost,
    required this.destructive,
    required this.disabled,
  });

  factory AppButtonExtension.fromColors(
    AppColorsExtension colors,
    AppTypographyExtension typography,
  ) {
    // Base button text style
    final buttonTextStyle = typography.labelLarge.copyWith(
      fontWeight: FontWeight.w600,
    );

    return AppButtonExtension(
      primary: TokenBundle(
        backgroundColor: colors.borderFocus, // Using primary color
        foregroundColor: colors.textInverse,
        textStyle: buttonTextStyle,
      ),
      secondary: TokenBundle(
        backgroundColor: colors.surfaceContainer,
        foregroundColor: colors.textPrimary,
        textStyle: buttonTextStyle,
      ),
      outline: TokenBundle(
        backgroundColor: Colors.transparent,
        foregroundColor: colors.borderFocus, // Primary text
        borderColor: colors.borderFocus, // Primary border
        textStyle: buttonTextStyle,
      ),
      ghost: TokenBundle(
        backgroundColor: Colors.transparent,
        foregroundColor: colors.textPrimary,
        textStyle: buttonTextStyle,
      ),
      destructive: TokenBundle(
        backgroundColor: colors.error,
        foregroundColor: colors.textInverse,
        textStyle: buttonTextStyle,
      ),
      disabled: TokenBundle(
        backgroundColor: colors.surfaceContainer,
        foregroundColor: colors.textDisabled,
        textStyle: buttonTextStyle,
      ),
    );
  }

  @override
  ThemeExtension<AppButtonExtension> copyWith({
    TokenBundle? primary,
    TokenBundle? secondary,
    TokenBundle? outline,
    TokenBundle? ghost,
    TokenBundle? destructive,
    TokenBundle? disabled,
  }) {
    return AppButtonExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      outline: outline ?? this.outline,
      ghost: ghost ?? this.ghost,
      destructive: destructive ?? this.destructive,
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  ThemeExtension<AppButtonExtension> lerp(
    ThemeExtension<AppButtonExtension>? other,
    double t,
  ) {
    if (other is! AppButtonExtension) {
      return this;
    }
    return AppButtonExtension(
      primary: TokenBundle.lerp(primary, other.primary, t)!,
      secondary: TokenBundle.lerp(secondary, other.secondary, t)!,
      outline: TokenBundle.lerp(outline, other.outline, t)!,
      ghost: TokenBundle.lerp(ghost, other.ghost, t)!,
      destructive: TokenBundle.lerp(destructive, other.destructive, t)!,
      disabled: TokenBundle.lerp(disabled, other.disabled, t)!,
    );
  }
}
