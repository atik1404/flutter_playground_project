part of 'app_colors_aggregator.dart';

final class DividerColor extends ThemeExtension<DividerColor>
    with ColorFieldsMixin<DividerColor> {
  final Color primary;
  final Color secondary;

  DividerColor._({required this.primary, required this.secondary});

  @override
  ThemeExtension<DividerColor> copyWith({
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
    primary: ColorPallet.neutral300,
    secondary: ColorPallet.neutral200,
  );

  static final _darkThemeColor = DividerColor._(
    primary: ColorPallet.neutral300,
    secondary: ColorPallet.neutral200,
  );
}
