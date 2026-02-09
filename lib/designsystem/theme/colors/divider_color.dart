part of 'app_colors_aggregator.dart';

final class DividerColor extends ThemeExtension<DividerColor>
    with ColorFieldsMixin<DividerColor> {
  /// The color of the primary divider (e.g., between sections).
  final Color primary;

  /// The color of the secondary divider (e.g., subtle separators).
  final Color secondary;

  DividerColor._({required this.primary, required this.secondary});

  @override
  DividerColor copyWith({
    Color? primaryDividerColor,
    Color? secondaryDividerColor,
  }) {
    return copyWithList([primaryDividerColor, secondaryDividerColor]);
  }

  @override
  List<Color> get colorFields => [primary, secondary];

  @override
  DividerColor createInstance(List<Color> colors) {
    return DividerColor._(primary: colors[0], secondary: colors[1]);
  }

  static final _lightThemeColor = DividerColor._(
    primary: ColorPallet.neutral.shade300,
    secondary: ColorPallet.neutral.shade200,
  );

  static final _darkThemeColor = DividerColor._(
    primary: ColorPallet.neutral.shade300,
    secondary: ColorPallet.neutral.shade200,
  );
}
