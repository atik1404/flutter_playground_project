part of 'dimension_aggregator.dart';

/// Defines the icon size tokens for the application design system.
///
/// This extension standardizes icon sizing across the app, ensuring consistency
/// in visual weight and layout alignment.
final class IconSize extends ThemeExtension<IconSize>
    with NumericFieldsMixin<IconSize> {
  /// Extra Extra Small icon (e.g., 12px).
  /// Used for very small indicators, inline text icons, or dense data tables.
  final double xxs;

  /// Extra Small icon (e.g., 16px).
  /// Used for secondary information, dense list tiles, or form field suffixes.
  final double xs;

  /// Small icon (e.g., 20px).
  /// Used for chips, small buttons, or tight layouts.
  final double sm;

  /// Medium/Standard icon (e.g., 24px).
  /// The default standard size for navigation bars, app bars, and floating action buttons.
  final double md;

  /// Large icon (e.g., 32px).
  /// Used for section headers, large buttons, or avatar placeholders.
  final double lg;

  /// Extra Large icon (e.g., 40px).
  /// Used for hero sections, empty state illustrations, or emphasized actions.
  final double xl;

  /// Extra Extra Large icon (e.g., 48px).
  /// Used for very prominent display icons or onboarding screens.
  final double xxl;

  const IconSize._({
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  @override
  ThemeExtension<IconSize> copyWith({
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return createInstance([
      xxs ?? this.xxs,
      xs ?? this.xs,
      sm ?? this.sm,
      md ?? this.md,
      lg ?? this.lg,
      xl ?? this.xl,
      xxl ?? this.xxl,
    ]);
  }

  @override
  IconSize createInstance(List<double> values) {
    return IconSize._(
      xxs: values[0],
      xs: values[1],
      sm: values[2],
      md: values[3],
      lg: values[4],
      xl: values[5],
      xxl: values[6],
    );
  }

  @override
  List<double> get numericFields => [xxs, xs, sm, md, lg, xl, xxl];

  /// The default standard instance of [IconSize].
  static const _standard = IconSize._(
    xxs: 12,
    xs: 16,
    sm: 20,
    md: 24, // Material Design standard default
    lg: 32,
    xl: 40,
    xxl: 48,
  );
}
