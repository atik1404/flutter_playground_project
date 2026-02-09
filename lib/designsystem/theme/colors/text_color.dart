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

  TextColor._({
    required this.primary,
    required this.secondary,
    required this.white,
    required this.tertiary,
    required this.error,
  });

  @override
  TextColor copyWith({
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? whiteTextColor,
    Color? errorTextColor,
    Color? tertiaryTextColor,
  }) {
    return copyWithList([
      primaryTextColor,
      secondaryTextColor,
      whiteTextColor,
      tertiaryTextColor,
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
      white: colors[2],
      tertiary: colors[3],
      error: colors[4],
    );
  }

  static final _lightThemeColor = TextColor._(
    primary: ColorPallet.neutral.shade900,
    secondary: ColorPallet.neutral.shade600,
    tertiary: ColorPallet.neutral.shade300,
    white: ColorPallet.white,
    error: ColorPallet.error.shade500,
  );

  static final _darkThemeColor = TextColor._(
    primary: ColorPallet.neutral.shade900,
    secondary: ColorPallet.neutral.shade600,
    tertiary: ColorPallet.neutral.shade300,
    white: ColorPallet.white,
    error: ColorPallet.error.shade500,
  );
}
