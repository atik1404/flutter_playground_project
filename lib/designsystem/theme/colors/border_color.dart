part of 'app_colors_aggregator.dart';

final class StrokeColor extends ThemeExtension<StrokeColor>
    with ColorFieldsMixin<StrokeColor> {
  final Color primary;
  final Color secondary;
  final Color error;
  final Color disable;

  StrokeColor._({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.disable,
  });

  @override
  ThemeExtension<StrokeColor> copyWith({
    Color? primaryStrokeColor,
    Color? secondaryStrokeColor,
    Color? errorStrokeColor,
    Color? disableStrokeColor,
  }) {
    return copyWithList([
      primaryStrokeColor,
      secondaryStrokeColor,
      errorStrokeColor,
      disableStrokeColor,
    ]);
  }

  @override
  List<Color> get colorFields => [primary, secondary, error, disable];

  @override
  StrokeColor createInstance(List<Color> colors) {
    return StrokeColor._(
      primary: colors[0],
      secondary: colors[1],
      error: colors[2],
      disable: colors[3],
    );
  }

  static final _lightThemeColor = StrokeColor._(
    primary: ColorPallet.primary500,
    secondary: ColorPallet.secondary500,
    error: ColorPallet.error500,
    disable: ColorPallet.neutral300,
  );

  static final _darkThemeColor = StrokeColor._(
    primary: ColorPallet.primary500,
    secondary: ColorPallet.secondary500,
    error: ColorPallet.error500,
    disable: ColorPallet.neutral300,
  );
}
