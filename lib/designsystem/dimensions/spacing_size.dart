part of 'dimension_aggregator.dart';

/// Defines the spacing tokens (padding/margin/gap) for the application design system.
///
/// This extension standardizes whitespace, ensuring a consistent 4pt or 8pt grid
/// alignment across the UI.
final class SpacingSize extends ThemeExtension<SpacingSize>
    with NumericFieldsMixin<SpacingSize> {
  /// No spacing (0px).
  /// Used to remove default padding or merge elements visually.
  final double none;

  /// Extra Extra Small spacing (e.g., 2px).
  /// Used for tight gaps between related text elements or border offsets.
  final double xxs;

  /// Extra Small spacing (e.g., 4px).
  /// Used for compact elements, dense lists, or small visual groupings.
  final double xs;

  /// Small spacing (e.g., 8px).
  /// Used for internal card padding, gaps between icons and text, or compact margins.
  final double sm;

  /// Medium/Standard spacing (e.g., 16px).
  /// The default padding for screen edges, cards, and standard containers.
  final double md;

  /// Large spacing (e.g., 24px).
  /// Used for section separation, larger modal padding, or distinct content blocks.
  final double lg;

  /// Extra Large spacing (e.g., 32px).
  /// Used for major layout divisions or top-level screen margins.
  final double xl;

  /// Extra Extra Large spacing (e.g., 48px).
  /// Used for generous whitespace in hero sections or between major features.
  final double xxl;

  const SpacingSize._({
    required this.none,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  @override
  ThemeExtension<SpacingSize> copyWith({
    double? none,
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return createInstance([
      none ?? this.none,
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
  SpacingSize createInstance(List<double> values) {
    return SpacingSize._(
      none: values[0],
      xxs: values[1],
      xs: values[2],
      sm: values[3],
      md: values[4],
      lg: values[5],
      xl: values[6],
      xxl: values[7],
    );
  }

  @override
  List<double> get numericFields => [none, xxs, xs, sm, md, lg, xl, xxl];

  /// The default standard instance of [SpacingSize].
  static const standard = SpacingSize._(
    none: 0,
    xxs: 2,
    xs: 4,
    sm: 8,
    md: 16,
    lg: 24,
    xl: 32,
    xxl: 48,
  );
}
