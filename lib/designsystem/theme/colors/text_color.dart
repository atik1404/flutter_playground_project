part of 'app_colors_aggregator.dart';

final class TextColor extends ThemeExtension<TextColor>
    with ColorFieldsMixin<TextColor> {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color white;
  final Color error;

  TextColor._({
    required this.primary,
    required this.secondary,
    required this.white,
    required this.tertiary,
    required this.error,
  });

  @override
  ThemeExtension<TextColor> copyWith({
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? whiteTextColor,
    Color? errorTextColor,
  }) {
    return copyWithList([
      primaryTextColor,
      secondaryTextColor,
      whiteTextColor,
      errorTextColor,
    ]);
  }

  @override
  List<Color> get colorFields => [primary, secondary, white, tertiary, error];

  @override
  TextColor createInstance(List<Color> colors) {
    return TextColor._(
      primary: colors[0],
      secondary: colors[1],
      tertiary: colors[2],
      white: colors[3],
      error: colors[4],
    );
  }

  static final _lightThemeColor = TextColor._(
    primary: ColorPallet.neutral950,
    secondary: ColorPallet.neutral600,
    tertiary: ColorPallet.neutral300,
    white: ColorPallet.white,
    error: ColorPallet.error500,
  );

  static final _darkThemeColor = TextColor._(
    primary: ColorPallet.neutral950,
    secondary: ColorPallet.neutral600,
    tertiary: ColorPallet.neutral300,
    white: ColorPallet.white,
    error: ColorPallet.error500,
  );
}
