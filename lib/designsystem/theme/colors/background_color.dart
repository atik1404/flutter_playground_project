part of 'app_colors_aggregator.dart';

final class BackgroundColor extends ThemeExtension<BackgroundColor>
    with ColorFieldsMixin<BackgroundColor> {
  final Color primary;
  final Color secondary;
  final Color item;

  BackgroundColor._({
    required this.primary,
    required this.secondary,
    required this.item,
  });

  @override
  List<Color> get colorFields => [primary, secondary, item];

  @override
  ThemeExtension<BackgroundColor> copyWith({
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
    primary: ColorPallet.neutral50,
    secondary: ColorPallet.neutral100,
    item: ColorPallet.neutral50,
  );

  static final _darkThemeColor = BackgroundColor._(
    primary: ColorPallet.neutral800,
    secondary: ColorPallet.neutral700,
    item: ColorPallet.neutral800,
  );
}
