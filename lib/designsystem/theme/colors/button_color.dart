part of 'app_colors_aggregator.dart';

final class ButtonColor extends ThemeExtension<ButtonColor>
    with ColorFieldsMixin<ButtonColor> {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color disable;
  final Color disableContainer;
  final Color error;
  final Color errorContainer;

  ButtonColor._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.disable,
    required this.disableContainer,
    required this.error,
    required this.errorContainer,
  });

  @override
  ThemeExtension<ButtonColor> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? disable,
    Color? disableContainer,
    Color? error,
    Color? errorContainer,
  }) {
    return copyWithList([
      primary,
      onPrimary,
      secondary,
      onSecondary,
      primaryContainer,
      onPrimaryContainer,
      disable,
      disableContainer,
      error,
      errorContainer,
    ]);
  }

  @override
  List<Color> get colorFields => [
    primary,
    onPrimary,
    secondary,
    onSecondary,
    primaryContainer,
    onPrimaryContainer,
    disable,
    disableContainer,
    error,
    errorContainer,
  ];

  @override
  ButtonColor createInstance(List<Color> colors) {
    return ButtonColor._(
      primary: colors[0],
      onPrimary: colors[1],
      secondary: colors[2],
      onSecondary: colors[3],
      primaryContainer: colors[4],
      onPrimaryContainer: colors[5],
      disable: colors[6],
      disableContainer: colors[7],
      error: colors[8],
      errorContainer: colors[9],
    );
  }

  static final _lightThemeColor = ButtonColor._(
    primary: ColorPallet.primary.shade500,
    onPrimary: ColorPallet.white,
    secondary: ColorPallet.secondary.shade500,
    onSecondary: ColorPallet.white,
    primaryContainer: ColorPallet.primary.shade500,
    onPrimaryContainer: ColorPallet.white,
    disable: ColorPallet.primary.shade100,
    disableContainer: ColorPallet.neutral.shade600,
    error: ColorPallet.error.shade500,
    errorContainer: ColorPallet.error.shade100,
  );

  static final _darkThemeColor = ButtonColor._(
    primary: ColorPallet.primary.shade600,
    onPrimary: ColorPallet.white,
    secondary: ColorPallet.secondary.shade500,
    onSecondary: ColorPallet.white,
    primaryContainer: ColorPallet.primary.shade500,
    onPrimaryContainer: ColorPallet.white,
    disable: ColorPallet.primary.shade100,
    disableContainer: ColorPallet.neutral.shade600,
    error: ColorPallet.error.shade500,
    errorContainer: ColorPallet.error.shade100,
  );
}
