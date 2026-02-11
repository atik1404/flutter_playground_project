part of 'app_colors_aggregator.dart';

final class BackgroundColor extends ThemeExtension<BackgroundColor>
    with ColorFieldsMixin<BackgroundColor> {
  /// The primary background color of the app.
  final Color primary;

  /// The secondary background color of the app.
  final Color secondary;

  /// The background color for items (e.g., list items, cards).
  final Color item;

  final Color indigo;
  final Color info;
  final Color jungleGreen;
  final Color turquoise;

  BackgroundColor._({
    required this.primary,
    required this.secondary,
    required this.item,
    required this.indigo,
    required this.info,
    required this.jungleGreen,
    required this.turquoise,
  });

  @override
  List<Color> get colorFields => [
    primary,
    secondary,
    item,
    indigo,
    info,
    jungleGreen,
    turquoise,
  ];

  @override
  BackgroundColor copyWith({
    Color? primaryBackgroundColor,
    Color? secondaryBackgroundColor,
    Color? introductionBackgroundColor,
    Color? violetBackgroundColor,
    Color? infoBackgroundColor,
    Color? turquoise,
    Color? jungleGreen,
  }) {
    return copyWithList([
      primaryBackgroundColor,
      secondaryBackgroundColor,
      introductionBackgroundColor,
      violetBackgroundColor,
      infoBackgroundColor,
      jungleGreen,
      turquoise,
    ]);
  }

  @override
  BackgroundColor createInstance(List<Color> colors) {
    return BackgroundColor._(
      primary: colors[0],
      secondary: colors[1],
      item: colors[2],
      indigo: colors[3],
      info: colors[4],
      jungleGreen: colors[5],
      turquoise: colors[6],
    );
  }

  static final _lightThemeColor = BackgroundColor._(
    primary: ColorPallet.neutral.shade500,
    secondary: ColorPallet.neutral.shade100,
    item: ColorPallet.neutral.shade50,
    indigo: ColorPallet.indigo.shade50,
    info: ColorPallet.info.shade50,
    jungleGreen: ColorPallet.jungleGreen.shade50,
    turquoise: ColorPallet.turquoise.shade50,
  );

  static final _darkThemeColor = BackgroundColor._(
    primary: ColorPallet.neutral.shade900,
    secondary: ColorPallet.neutral.shade700,
    item: ColorPallet.neutral.shade800,
    indigo: ColorPallet.indigo.shade50,
    info: ColorPallet.info.shade50,
    jungleGreen: ColorPallet.jungleGreen.shade50,
    turquoise: ColorPallet.turquoise.shade50,
  );
}
