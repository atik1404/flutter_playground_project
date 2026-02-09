part of 'app_colors_aggregator.dart';

final class BackgroundColor extends ThemeExtension<BackgroundColor>
    with ColorFieldsMixin<BackgroundColor> {
  /// The primary background color of the app.
  final Color primary;

  /// The secondary background color of the app.
  final Color secondary;

  /// The background color for items (e.g., list items, cards).
  final Color item;

  BackgroundColor._({
    required this.primary,
    required this.secondary,
    required this.item,
  });

  @override
  List<Color> get colorFields => [primary, secondary, item];

  @override
  BackgroundColor copyWith({
    Color? primaryBackgroundColor,
    Color? secondaryBackgroundColor,
    Color? introductionBackgroundColor,
  }) {
    return copyWithList([
      primaryBackgroundColor,
      secondaryBackgroundColor,
      introductionBackgroundColor,
    ]);
  }

  @override
  BackgroundColor createInstance(List<Color> colors) {
    return BackgroundColor._(
      primary: colors[0],
      secondary: colors[1],
      item: colors[2],
    );
  }

  static final _lightThemeColor = BackgroundColor._(
    primary: ColorPallet.neutral.shade500,
    secondary: ColorPallet.neutral.shade100,
    item: ColorPallet.neutral.shade50,
  );

  static final _darkThemeColor = BackgroundColor._(
    primary: ColorPallet.neutral.shade900,
    secondary: ColorPallet.neutral.shade700,
    item: ColorPallet.neutral.shade800,
  );
}
