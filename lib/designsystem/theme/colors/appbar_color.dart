part of 'app_colors_aggregator.dart';

final class AppBarColor extends ThemeExtension<AppBarColor>
    with ColorFieldsMixin<AppBarColor> {
  /// The color of the primary container in the app bar.
  final Color primaryContainer;

  /// The content color (text/icon) on the primary container.
  final Color onPrimaryContainer;

  /// The color of the secondary container in the app bar.
  final Color secondaryContainer;

  /// The content color (text/icon) on the secondary container.
  final Color onSecondaryContainer;

  AppBarColor._({
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
  });

  @override
  List<Color> get colorFields => [
    primaryContainer,
    onPrimaryContainer,
    secondaryContainer,
    onSecondaryContainer,
  ];

  @override
  AppBarColor copyWith({
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
  }) {
    return copyWithList([
      primaryContainer,
      onPrimaryContainer,
      secondaryContainer,
      onSecondaryContainer,
    ]);
  }

  @override
  AppBarColor createInstance(List<Color> colors) {
    return AppBarColor._(
      primaryContainer: colors[0],
      onPrimaryContainer: colors[1],
      secondaryContainer: colors[2],
      onSecondaryContainer: colors[3],
    );
  }

  static final _lightThemeColor = AppBarColor._(
    primaryContainer: ColorPallet.primary.shade500,
    onPrimaryContainer: ColorPallet.white,
    secondaryContainer: ColorPallet.secondary.shade500,
    onSecondaryContainer: ColorPallet.black,
  );

  static final _darkThemeColor = AppBarColor._(
    primaryContainer: ColorPallet.primary.shade500,
    onPrimaryContainer: ColorPallet.white,
    secondaryContainer: ColorPallet.secondary.shade500,
    onSecondaryContainer: ColorPallet.black,
  );
}
