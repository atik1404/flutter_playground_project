import 'package:flutter/material.dart';
import '../foundations/app_primitives.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  // Backgrounds
  final Color background;
  final Color surface;
  final Color surfaceContainer;

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textInverse;
  final Color textDisabled;

  // Status
  final Color info;
  final Color success;
  final Color warning;
  final Color error;

  // Borders
  final Color border;
  final Color borderFocus;
  final Color borderError;

  const AppColorsExtension({
    required this.background,
    required this.surface,
    required this.surfaceContainer,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textInverse,
    required this.textDisabled,
    required this.info,
    required this.success,
    required this.warning,
    required this.error,
    required this.border,
    required this.borderFocus,
    required this.borderError,
  });

  // Light Theme Factory
  factory AppColorsExtension.light() {
    return const AppColorsExtension(
      background: AppPrimitives.neutral50,
      surface: AppPrimitives.white,
      surfaceContainer: AppPrimitives.neutral100,
      textPrimary: AppPrimitives.neutral900,
      textSecondary: AppPrimitives.neutral600,
      textTertiary: AppPrimitives.neutral400,
      textInverse: AppPrimitives.white,
      textDisabled: AppPrimitives.neutral300,
      info: AppPrimitives.info500,
      success: AppPrimitives.success500,
      warning: AppPrimitives.warning500,
      error: AppPrimitives.error500,
      border: AppPrimitives.neutral200,
      borderFocus: AppPrimitives.primary500,
      borderError: AppPrimitives.error500,
    );
  }

  // Dark Theme Factory
  factory AppColorsExtension.dark() {
    return const AppColorsExtension(
      background: AppPrimitives.neutral950,
      surface: AppPrimitives.neutral900,
      surfaceContainer: AppPrimitives.neutral800,
      textPrimary: AppPrimitives.neutral50,
      textSecondary: AppPrimitives.neutral400,
      textTertiary: AppPrimitives.neutral600,
      textInverse: AppPrimitives.neutral900,
      textDisabled: AppPrimitives.neutral700,
      info: AppPrimitives.info400,
      success: AppPrimitives.success400,
      warning: AppPrimitives.warning400,
      error: AppPrimitives.error400,
      border: AppPrimitives.neutral700,
      borderFocus: AppPrimitives.primary400,
      borderError: AppPrimitives.error400,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? background,
    Color? surface,
    Color? surfaceContainer,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textInverse,
    Color? textDisabled,
    Color? info,
    Color? success,
    Color? warning,
    Color? error,
    Color? border,
    Color? borderFocus,
    Color? borderError,
  }) {
    return AppColorsExtension(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textInverse: textInverse ?? this.textInverse,
      textDisabled: textDisabled ?? this.textDisabled,
      info: info ?? this.info,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      border: border ?? this.border,
      borderFocus: borderFocus ?? this.borderFocus,
      borderError: borderError ?? this.borderError,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceContainer: Color.lerp(
        surfaceContainer,
        other.surfaceContainer,
        t,
      )!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      info: Color.lerp(info, other.info, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderFocus: Color.lerp(borderFocus, other.borderFocus, t)!,
      borderError: Color.lerp(borderError, other.borderError, t)!,
    );
  }
}
