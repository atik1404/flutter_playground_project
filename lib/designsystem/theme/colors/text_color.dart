part of 'app_colors_aggregator.dart';

final class TextColor extends ThemeExtension<TextColor>
    with ColorFieldsMixin<TextColor> {
  /// The primary text color (e.g., headings, body).
  final Color primary;

  /// The secondary text color (e.g., subtitles, captions).
  final Color secondary;

  /// The tertiary text color (e.g., less important info).
  final Color tertiary;

  /// White text color (typically used on dark backgrounds).
  final Color white;

  /// The text color used to indicate error.
  final Color error;

  final Color indigo;
  final Color info;

  final Color jungleGreen;
  final Color turquoise;
  final Color navyBlue;

  TextColor._({
    required this.primary,
    required this.secondary,
    required this.white,
    required this.tertiary,
    required this.error,
    required this.indigo,
    required this.info,
    required this.jungleGreen,
    required this.turquoise,
    required this.navyBlue,
  });

  @override
  TextColor copyWith({
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? whiteTextColor,
    Color? errorTextColor,
    Color? tertiaryTextColor,
    Color? violetTextColor,
    Color? infoTextColor,
    Color? jungleGreen,
    Color? turquoise,
    Color? navyBlue,
  }) {
    return copyWithList([
      primaryTextColor,
      secondaryTextColor,
      whiteTextColor,
      tertiaryTextColor,
      errorTextColor,
      violetTextColor,
      infoTextColor,
      jungleGreen,
      turquoise,
      navyBlue,
    ]);
  }

  @override
  List<Color> get colorFields => [
    primary,
    secondary,
    white,
    tertiary,
    error,
    indigo,
    info,
    jungleGreen,
    turquoise,
    navyBlue,
  ];

  @override
  TextColor createInstance(List<Color> colors) {
    return TextColor._(
      primary: colors[0],
      secondary: colors[1],
      white: colors[2],
      tertiary: colors[3],
      error: colors[4],
      indigo: colors[5],
      info: colors[6],
      jungleGreen: colors[7],
      turquoise: colors[8],
      navyBlue: colors[9],
    );
  }

  static final _lightThemeColor = TextColor._(
    primary: ColorPallet.navyBlue.shade600,
    secondary: ColorPallet.navyBlue.shade300,
    tertiary: ColorPallet.navyBlue.shade100,
    white: ColorPallet.white,
    error: ColorPallet.error.shade500,
    indigo: ColorPallet.indigo.shade500,
    info: ColorPallet.info.shade500,
    jungleGreen: ColorPallet.jungleGreen.shade500,
    turquoise: ColorPallet.turquoise.shade500,
    navyBlue: ColorPallet.navyBlue.shade500,
  );

  static final _darkThemeColor = TextColor._(
    primary: ColorPallet.navyBlue.shade600,
    secondary: ColorPallet.navyBlue.shade300,
    tertiary: ColorPallet.navyBlue.shade100,
    white: ColorPallet.white,
    error: ColorPallet.error.shade500,
    indigo: ColorPallet.indigo.shade500,
    info: ColorPallet.info.shade500,
    jungleGreen: ColorPallet.jungleGreen.shade500,
    turquoise: ColorPallet.turquoise.shade500,
    navyBlue: ColorPallet.navyBlue.shade500,
  );
}
