part of 'app_colors_aggregator.dart';

final class BackgroundColor extends ThemeExtension<BackgroundColor>
    with ColorFieldsMixin<BackgroundColor> {
  /// The primary background color of the app.
  final Color primary;

  /// The secondary background color of the app.
  final Color secondary;

  /// The background color for items (e.g., list items, cards).
  final Color item;

  final Color violet;
  final Color info;

  BackgroundColor._({
    required this.primary,
    required this.secondary,
    required this.item,
    required this.violet,
    required this.info,
  });

  @override
  List<Color> get colorFields => [primary, secondary, item, violet, info];

  @override
  BackgroundColor copyWith({
    Color? primaryBackgroundColor,
    Color? secondaryBackgroundColor,
    Color? introductionBackgroundColor,
    Color? violetBackgroundColor,
    Color? infoBackgroundColor,
  }) {
    return copyWithList([
      primaryBackgroundColor,
      secondaryBackgroundColor,
      introductionBackgroundColor,
      violetBackgroundColor,
      infoBackgroundColor,
    ]);
  }

  @override
  BackgroundColor createInstance(List<Color> colors) {
    return BackgroundColor._(
      primary: colors[0],
      secondary: colors[1],
      item: colors[2],
      violet: colors[3],
      info: colors[4],
    );
  }

  static final _lightThemeColor = BackgroundColor._(
    primary: ColorPallet.neutral.shade500,
    secondary: ColorPallet.neutral.shade100,
    item: ColorPallet.neutral.shade50,
    violet: ColorPallet.indigo.shade100,
    info: ColorPallet.info.shade50,
  );

  static final _darkThemeColor = BackgroundColor._(
    primary: ColorPallet.neutral.shade900,
    secondary: ColorPallet.neutral.shade700,
    item: ColorPallet.neutral.shade800,
    violet: ColorPallet.indigo.shade100,
    info: ColorPallet.info.shade50,
  );
}
