part of 'dimension_aggregator.dart';

/// Defines the divider thickness tokens for the application design system.
///
/// This extension standardizes the thickness (height/width) of dividers and borders
/// throughout the app, ensuring consistent visual separation between content.
final class DividerSize extends ThemeExtension<DividerSize>
    with NumericFieldsMixin<DividerSize> {
  /// A thin hairline divider (e.g., 1px).
  ///
  /// Used for standard list item separators, subtle borders on cards, or
  /// unobtrusive grouping within a content block.
  final double thin;

  /// A thick structural divider (e.g., 2px).
  ///
  /// Used for separating distinct sections of content, major grouping elements,
  /// or selected states in navigation (e.g., bottom border of an active tab).
  final double thick;

  /// A bold, heavy divider (e.g., 3px+).
  ///
  /// Used for strong visual breaks, drag handles, focus indicators, or
  /// distinctive brand elements that require high visibility.
  final double bold;

  const DividerSize._({
    required this.thin,
    required this.thick,
    required this.bold,
  });

  @override
  ThemeExtension<DividerSize> copyWith({
    double? thin,
    double? thick,
    double? bold,
  }) {
    return createInstance([
      thin ?? this.thin,
      thick ?? this.thick,
      bold ?? this.bold,
    ]);
  }

  @override
  DividerSize createInstance(List<double> values) {
    return DividerSize._(thin: values[0], thick: values[1], bold: values[2]);
  }

  @override
  List<double> get numericFields => [thin, thick, bold];

  /// The default standard instance of [DividerSize].
  static const _standard = DividerSize._(
    thin: 1,
    thick: 2,
    bold: 4, // Slightly increased from 3 to make the difference more visible
  );
}
