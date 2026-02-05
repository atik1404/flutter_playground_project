import 'package:flutter/material.dart';
import '../foundations/app_typography_raw.dart';
import 'app_colors.dart';

@immutable
class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;

  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;

  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;

  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  final TextStyle labelLarge;
  final TextStyle labelSmall;

  const AppTypographyExtension({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelSmall,
  });

  factory AppTypographyExtension.fromColors(AppColorsExtension colors) {
    // Base style using Roboto and the primary text color from the passed semantic colors
    final baseStyle = TextStyle(
      fontFamily: AppTypographyRaw.fontFamily,
      color: colors.textPrimary,
      leadingDistribution: TextLeadingDistribution.even,
    );

    return AppTypographyExtension(
      displayLarge: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize57,
        fontWeight: AppTypographyRaw.weightRegular,
      ),
      displayMedium: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize45,
        fontWeight: AppTypographyRaw.weightRegular,
      ),
      displaySmall: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize36,
        fontWeight: AppTypographyRaw.weightRegular,
      ),
      headlineLarge: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize32,
        fontWeight: AppTypographyRaw.weightRegular,
      ),
      headlineMedium: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize28,
        fontWeight: AppTypographyRaw.weightRegular,
      ),
      headlineSmall: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize24,
        fontWeight: AppTypographyRaw.weightRegular,
      ),
      titleLarge: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize22,
        fontWeight: AppTypographyRaw.weightMedium,
      ),
      titleMedium: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize16,
        fontWeight: AppTypographyRaw.weightMedium,
        letterSpacing: 0.15,
      ),
      titleSmall: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize14,
        fontWeight: AppTypographyRaw.weightMedium,
        letterSpacing: 0.1,
      ),
      bodyLarge: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize16,
        fontWeight: AppTypographyRaw.weightRegular,
        letterSpacing: 0.5,
      ),
      bodyMedium: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize14,
        fontWeight: AppTypographyRaw.weightRegular,
        letterSpacing: 0.25,
      ),
      bodySmall: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize12,
        fontWeight: AppTypographyRaw.weightRegular,
        letterSpacing: 0.4,
        color: colors.textSecondary,
      ),
      labelLarge: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize14,
        fontWeight: AppTypographyRaw.weightMedium,
        letterSpacing: 1.25,
      ),
      labelSmall: baseStyle.copyWith(
        fontSize: AppTypographyRaw.fontSize11,
        fontWeight: AppTypographyRaw.weightMedium,
        letterSpacing: 1.5,
        color: colors.textSecondary,
      ),
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelSmall,
  }) {
    return AppTypographyExtension(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelSmall: labelSmall ?? this.labelSmall,
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> lerp(
    ThemeExtension<AppTypographyExtension>? other,
    double t,
  ) {
    if (other is! AppTypographyExtension) {
      return this;
    }
    return AppTypographyExtension(
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
    );
  }
}
