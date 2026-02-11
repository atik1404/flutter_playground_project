part of 'app_colors_aggregator.dart';

final class BorderColor extends ThemeExtension<BorderColor>
    with ColorFieldsMixin<BorderColor> {
  /// The primary border color.
  final Color primary;

  /// The secondary border color.
  final Color secondary;

  /// The border color used to indicate error.
  final Color error;

  /// The border color used when disabled.
  final Color disable;

  final Color indigo;
  final Color info;

  BorderColor._({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.disable,
    required this.indigo,
    required this.info,
  });

  @override
  BorderColor copyWith({
    Color? primaryStrokeColor,
    Color? secondaryStrokeColor,
    Color? errorStrokeColor,
    Color? disableStrokeColor,
    Color? violetStrokeColor,
    Color? infoStrokeColor,
  }) {
    return copyWithList([
      primaryStrokeColor,
      secondaryStrokeColor,
      errorStrokeColor,
      disableStrokeColor,
      violetStrokeColor,
      infoStrokeColor,
    ]);
  }

  @override
  List<Color> get colorFields => [
    primary,
    secondary,
    error,
    disable,
    indigo,
    info,
  ];

  @override
  BorderColor createInstance(List<Color> colors) {
    return BorderColor._(
      primary: colors[0],
      secondary: colors[1],
      error: colors[2],
      disable: colors[3],
      indigo: colors[4],
      info: colors[5],
    );
  }

  static final _lightThemeColor = BorderColor._(
    primary: ColorPallet.navyBlue.shade50,
    secondary: ColorPallet.secondary.shade500,
    error: ColorPallet.error.shade500,
    disable: ColorPallet.neutral.shade300,
    indigo: ColorPallet.indigo.shade500,
    info: ColorPallet.info.shade500,
  );

  static final _darkThemeColor = BorderColor._(
    primary: ColorPallet.navyBlue.shade50,
    secondary: ColorPallet.secondary.shade500,
    error: ColorPallet.error.shade500,
    disable: ColorPallet.neutral.shade300,
    indigo: ColorPallet.indigo.shade500,
    info: ColorPallet.info.shade500,
  );
}
