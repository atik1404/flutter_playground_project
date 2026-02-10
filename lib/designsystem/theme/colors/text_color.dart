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

  final Color violet;
  final Color info;

  TextColor._({
    required this.primary,
    required this.secondary,
    required this.white,
    required this.tertiary,
    required this.error,
    required this.violet,
    required this.info,
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
  }) {
    return copyWithList([
      primaryTextColor,
      secondaryTextColor,
      whiteTextColor,
      tertiaryTextColor,
      errorTextColor,
      violetTextColor,
      infoTextColor,
    ]);
  }

  @override
  List<Color> get colorFields => [
    primary,
    secondary,
    white,
    tertiary,
    error,
    violet,
    info,
  ];

  @override
  TextColor createInstance(List<Color> colors) {
    return TextColor._(
      primary: colors[0],
      secondary: colors[1],
      white: colors[2],
      tertiary: colors[3],
      error: colors[4],
      violet: colors[5],
      info: colors[6],
    );
  }

  static final _lightThemeColor = TextColor._(
    primary: ColorPallet.neutral.shade900,
    secondary: ColorPallet.neutral.shade600,
    tertiary: ColorPallet.neutral.shade300,
    white: ColorPallet.white,
    error: ColorPallet.error.shade500,
    violet: ColorPallet.indigo.shade500,
    info: ColorPallet.info.shade500,
  );

  static final _darkThemeColor = TextColor._(
    primary: ColorPallet.neutral.shade900,
    secondary: ColorPallet.neutral.shade600,
    tertiary: ColorPallet.neutral.shade300,
    white: ColorPallet.white,
    error: ColorPallet.error.shade500,
    violet: ColorPallet.indigo.shade500,
    info: ColorPallet.info.shade500,
  );
}
