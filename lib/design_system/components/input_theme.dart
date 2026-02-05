import 'package:flutter/material.dart';
import 'component_spec.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_typography.dart';

@immutable
class AppInputExtension extends ThemeExtension<AppInputExtension> {
  final TokenBundle enabled;
  final TokenBundle focused;
  final TokenBundle error;
  final TokenBundle disabled;

  // Additional input-specific properties could go here (e.g., hintStyle overrides)

  const AppInputExtension({
    required this.enabled,
    required this.focused,
    required this.error,
    required this.disabled,
  });

  factory AppInputExtension.fromColors(
    AppColorsExtension colors,
    AppTypographyExtension typography,
  ) {
    final inputTextStyle = typography.bodyLarge;

    return AppInputExtension(
      enabled: TokenBundle(
        backgroundColor: colors.surface,
        foregroundColor: colors.textPrimary,
        borderColor: colors.border,
        textStyle: inputTextStyle,
      ),
      focused: TokenBundle(
        backgroundColor: colors.surface,
        foregroundColor: colors.textPrimary,
        borderColor: colors.borderFocus,
        textStyle: inputTextStyle,
      ),
      error: TokenBundle(
        backgroundColor: colors.surface,
        foregroundColor: colors.textPrimary,
        borderColor: colors.borderError,
        textStyle: inputTextStyle,
      ),
      disabled: TokenBundle(
        backgroundColor: colors.surfaceContainer,
        foregroundColor: colors.textDisabled,
        borderColor: Colors.transparent,
        textStyle: inputTextStyle.copyWith(color: colors.textDisabled),
      ),
    );
  }

  @override
  ThemeExtension<AppInputExtension> copyWith({
    TokenBundle? enabled,
    TokenBundle? focused,
    TokenBundle? error,
    TokenBundle? disabled,
  }) {
    return AppInputExtension(
      enabled: enabled ?? this.enabled,
      focused: focused ?? this.focused,
      error: error ?? this.error,
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  ThemeExtension<AppInputExtension> lerp(
    ThemeExtension<AppInputExtension>? other,
    double t,
  ) {
    if (other is! AppInputExtension) {
      return this;
    }
    return AppInputExtension(
      enabled: TokenBundle.lerp(enabled, other.enabled, t)!,
      focused: TokenBundle.lerp(focused, other.focused, t)!,
      error: TokenBundle.lerp(error, other.error, t)!,
      disabled: TokenBundle.lerp(disabled, other.disabled, t)!,
    );
  }
}
