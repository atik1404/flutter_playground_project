part of 'app_colors_aggregator.dart';

final class BorderColor extends ThemeExtension<BorderColor>
    with ColorFieldsMixin<BorderColor> {
  final Color primary;
  final Color secondary;
  final Color error;
  final Color disable;

  BorderColor._({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.disable,
  });

  @override
  ThemeExtension<BorderColor> copyWith({
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
  BorderColor createInstance(List<Color> colors) {
    return BorderColor._(
      primary: colors[0],
      secondary: colors[1],
      error: colors[2],
      disable: colors[3],
    );
  }

  static final _lightThemeColor = BorderColor._(
    primary: ColorPallet.primary.shade500,
    secondary: ColorPallet.secondary.shade500,
    error: ColorPallet.error.shade500,
    disable: ColorPallet.neutral.shade300,
  );

  static final _darkThemeColor = BorderColor._(
    primary: ColorPallet.primary.shade500,
    secondary: ColorPallet.secondary.shade500,
    error: ColorPallet.error.shade500,
    disable: ColorPallet.neutral.shade300,
  );
}
