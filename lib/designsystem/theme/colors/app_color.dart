part of 'app_colors_aggregator.dart';

final class AppColor extends ThemeExtension<AppColor>
    with ColorFieldsMixin<AppColor> {
  /// The primary color of the application.
  final Color primary;

  /// The content color (text/icon) on the primary color.
  final Color onPrimary;

  /// The primary container color.
  final Color primaryContainer;

  /// The content color (text/icon) on the primary container.
  final Color onPrimaryContainer;

  /// The secondary color of the application.
  final Color secondary;

  /// The content color (text/icon) on the secondary color.
  final Color onSecondary;

  /// The secondary container color.
  final Color secondaryContainer;

  /// The content color (text/icon) on the secondary container.
  final Color onSecondaryContainer;

  /// The tertiary color of the application.
  final Color tertiary;

  /// The content color (text/icon) on the tertiary color.
  final Color onTertiary;

  /// The surface color (e.g., cards, sheets).
  final Color surface;

  /// The content color (text/icon) on the surface.
  final Color onSurface;

  /// The color used to indicate error.
  final Color error;

  /// The content color (text/icon) on the error color.
  final Color onError;

  /// The inverse surface color.
  final Color inverseSurface;

  /// The content color (text/icon) on the inverse surface.
  final Color onInverseSurface;

  const AppColor._({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.onError,
    required this.inverseSurface,
    required this.onInverseSurface,
  });

  @override
  List<Color> get colorFields => [
    primary,
    onPrimary,
    primaryContainer,
    onPrimaryContainer,
    secondary,
    onSecondary,
    secondaryContainer,
    onSecondaryContainer,
    tertiary,
    onTertiary,
    surface,
    onSurface,
    error,
    onError,
    inverseSurface,
    onInverseSurface,
  ];

  @override
  AppColor createInstance(List<Color> colors) {
    return AppColor._(
      primary: colors[0],
      onPrimary: colors[1],
      primaryContainer: colors[2],
      onPrimaryContainer: colors[3],
      secondary: colors[4],
      onSecondary: colors[5],
      secondaryContainer: colors[6],
      onSecondaryContainer: colors[7],
      tertiary: colors[8],
      onTertiary: colors[9],
      surface: colors[10],
      onSurface: colors[11],
      error: colors[12],
      onError: colors[13],
      inverseSurface: colors[14],
      onInverseSurface: colors[15],
    );
  }

  @override
  AppColor copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? surface,
    Color? onSurface,
    Color? error,
    Color? onError,
    Color? inverseSurface,
    Color? onInverseSurface,
  }) {
    return copyWithList([
      primary,
      onPrimary,
      primaryContainer,
      onPrimaryContainer,
      secondary,
      onSecondary,
      secondaryContainer,
      onSecondaryContainer,
      tertiary,
      onTertiary,
      surface,
      onSurface,
      error,
      onError,
      inverseSurface,
      onInverseSurface,
    ]);
  }

  static final _lightThemeColor = AppColor._(
    primary: ColorPallet.primary.shade500,
    onPrimary: ColorPallet.white,
    primaryContainer: ColorPallet.primary.shade300,
    onPrimaryContainer: ColorPallet.black,
    secondary: ColorPallet.secondary.shade500,
    onSecondary: ColorPallet.white,
    secondaryContainer: ColorPallet.secondary.shade300,
    onSecondaryContainer: ColorPallet.black,
    tertiary: ColorPallet.neutral.shade100,
    onTertiary: ColorPallet.white,
    surface: ColorPallet.neutral.shade100,
    onSurface: ColorPallet.black,
    error: ColorPallet.error.shade500,
    onError: ColorPallet.white,
    inverseSurface: ColorPallet.white,
    onInverseSurface: ColorPallet.neutral.shade700,
  );

  static final _darkThemeColor = AppColor._(
    primary: ColorPallet.primary.shade500,
    onPrimary: ColorPallet.white,
    primaryContainer: ColorPallet.primary.shade300,
    onPrimaryContainer: ColorPallet.black,
    secondary: ColorPallet.secondary.shade500,
    onSecondary: ColorPallet.white,
    secondaryContainer: ColorPallet.secondary.shade300,
    onSecondaryContainer: ColorPallet.black,
    tertiary: ColorPallet.neutral.shade100,
    onTertiary: ColorPallet.white,
    surface: ColorPallet.neutral.shade100,
    onSurface: ColorPallet.black,
    error: ColorPallet.error.shade500,
    onError: ColorPallet.white,
    inverseSurface: ColorPallet.white,
    onInverseSurface: ColorPallet.neutral.shade700,
  );
}
