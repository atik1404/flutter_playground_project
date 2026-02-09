part of 'dimension_aggregator.dart';

/// Defines the corner radius tokens for the application design system.
///
/// This extension allows for consistent border radius sizing across widgets,
/// supporting themes and linear interpolation (lerp).
final class RadiusSize extends ThemeExtension<RadiusSize>
    with NumericFieldsMixin<RadiusSize> {
  /// No border radius (0px).
  /// Used for sharp corners, full-screen containers, or rectangular shapes.
  final double none;

  /// Extra Extra Small radius (e.g., 2px).
  /// Used for very subtle smoothing on tiny elements like tags or indicators.
  final double xxs;

  /// Extra Small radius (e.g., 4px).
  /// Used for small interactive elements, checkboxes, or inner content cards.
  final double xs;

  /// Small radius (e.g., 8px).
  /// Standard for buttons, input fields, and small cards.
  final double sm;

  /// Medium radius (e.g., 12px).
  /// Used for standard cards, dialogs, and bottom sheets.
  final double md;

  /// Large radius (e.g., 16px).
  /// Used for larger containers, modal surfaces, or highlighted content.
  final double lg;

  /// Extra Large radius (e.g., 24px).
  /// Used for floating action buttons (if squircle) or large distinctive panels.
  final double xl;

  /// Extra Extra Large radius (e.g., 32px).
  /// Used for very large surface containers.
  final double xxl;

  /// Full/Pill radius (e.g., 999px).
  /// Used to create perfectly circular or pill-shaped buttons (StadiumBorder).
  final double full;

  const RadiusSize._({
    required this.none,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.full,
  });

  @override
  ThemeExtension<RadiusSize> copyWith({
    double? none,
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    double? full,
  }) {
    // Passes the new values to the mixin to handle the instance creation.
    return createInstance([
      none ?? this.none,
      xxs ?? this.xxs,
      xs ?? this.xs,
      sm ?? this.sm,
      md ?? this.md,
      lg ?? this.lg,
      xl ?? this.xl,
      xxl ?? this.xxl,
      full ?? this.full,
    ]);
  }

  @override
  RadiusSize createInstance(List<double> values) {
    return RadiusSize._(
      none: values[0],
      xxs: values[1],
      xs: values[2],
      sm: values[3],
      md: values[4],
      lg: values[5],
      xl: values[6],
      xxl: values[7],
      full: values[8],
    );
  }

  @override
  List<double> get numericFields => [none, xxs, xs, sm, md, lg, xl, xxl, full];

  /// The default standard instance of [RadiusSize].
  static const _standard = RadiusSize._(
    none: 0,
    xxs: 2,
    xs: 4,
    sm: 8,
    md: 12,
    lg: 16,
    xl: 24,
    xxl: 32,
    full: 999, // Ensures a perfect stadium/circle shape
  );
}
