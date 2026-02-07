part of 'app_colors_aggregator.dart';


class AppColor extends ThemeExtension<AppColor>
    with ColorFieldsMixin<AppColor> {
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;
  final Color inverseSurface;
  final Color onInverseSurface;

  AppColor._({
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

  @override
  AppColor lerp(ThemeExtension<AppColor>? other, double t) {
    if (other is! AppColor) {
      return this;
    }

    return AppColor._(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t) ?? onPrimary,
      primaryContainer:
          Color.lerp(primaryContainer, other.primaryContainer, t) ??
          primaryContainer,
      onPrimaryContainer:
          Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t) ??
          onPrimaryContainer,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t) ?? onSecondary,
      secondaryContainer:
          Color.lerp(secondaryContainer, other.secondaryContainer, t) ??
          secondaryContainer,
      onSecondaryContainer:
          Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t) ??
          onSecondaryContainer,
      tertiary: Color.lerp(tertiary, other.tertiary, t) ?? tertiary,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t) ?? onTertiary,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      onSurface: Color.lerp(onSurface, other.onSurface, t) ?? onSurface,
      error: Color.lerp(error, other.error, t) ?? error,
      onError: Color.lerp(onError, other.onError, t) ?? onError,
      inverseSurface:
          Color.lerp(inverseSurface, other.inverseSurface, t) ?? inverseSurface,
      onInverseSurface:
          Color.lerp(onInverseSurface, other.onInverseSurface, t) ??
          onInverseSurface,
    );
  }

  static final _lightThemeColor = AppColor._(
    primary: ColorPallet.primary500,
    onPrimary: ColorPallet.white,
    primaryContainer: ColorPallet.primary300,
    onPrimaryContainer: ColorPallet.black,
    secondary: ColorPallet.secondary500,
    onSecondary: ColorPallet.white,
    secondaryContainer: ColorPallet.secondary300,
    onSecondaryContainer: ColorPallet.black,
    tertiary: ColorPallet.neutral100,
    onTertiary: ColorPallet.white,
    surface: ColorPallet.neutral100,
    onSurface: ColorPallet.black,
    error: ColorPallet.error500,
    onError: ColorPallet.white,
    inverseSurface: ColorPallet.white,
    onInverseSurface: ColorPallet.neutral700,
  );

  static final _darkThemeColor = AppColor._(
    primary: ColorPallet.primary500,
    onPrimary: ColorPallet.white,
    primaryContainer: ColorPallet.primary300,
    onPrimaryContainer: ColorPallet.black,
    secondary: ColorPallet.secondary500,
    onSecondary: ColorPallet.white,
    secondaryContainer: ColorPallet.secondary300,
    onSecondaryContainer: ColorPallet.black,
    tertiary: ColorPallet.neutral100,
    onTertiary: ColorPallet.white,
    surface: ColorPallet.neutral100,
    onSurface: ColorPallet.black,
    error: ColorPallet.error500,
    onError: ColorPallet.white,
    inverseSurface: ColorPallet.white,
    onInverseSurface: ColorPallet.neutral700,
  );
}
