part of 'app_colors_aggregator.dart';

final class ButtonColor extends ThemeExtension<ButtonColor>
    with ColorFieldsMixin<ButtonColor> {
  /// The background color of the primary button.
  final Color primary;

  /// The content color (text/icon) on the primary button.
  final Color onPrimary;

  /// The background color of the secondary button.
  final Color secondary;

  /// The content color (text/icon) on the secondary button.
  final Color onSecondary;

  /// The background color of the primary container.
  final Color primaryContainer;

  /// The content color (text/icon) on the primary container.
  final Color onPrimaryContainer;

  /// The border color of the outline button.
  final Color outline;

  /// The background color of the outline button.
  final Color outlineBackground;

  /// The content color (text/icon) on the outline button.
  final Color onOutline;

  /// The color of the button when disabled.
  final Color disable;

  /// The color of the button container when disabled.
  final Color disableContainer;

  /// The color used to indicate error on buttons.
  final Color error;

  /// The color used for error containers.
  final Color errorContainer;

  const ButtonColor._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.outline,
    required this.outlineBackground,
    required this.onOutline,
    required this.disable,
    required this.disableContainer,
    required this.error,
    required this.errorContainer,
  });

  @override
  ButtonColor copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? outline,
    Color? outlineBackground,
    Color? onOutline,
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
      outline,
      outlineBackground,
      onOutline,
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
    outline,
    outlineBackground,
    onOutline,
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
      outline: colors[6],
      outlineBackground: colors[7],
      onOutline: colors[8],
      disable: colors[9],
      disableContainer: colors[10],
      error: colors[11],
      errorContainer: colors[12],
    );
  }

  static final _lightThemeColor = ButtonColor._(
    primary: ColorPallet.primary.shade400,
    onPrimary: ColorPallet.white,
    secondary: ColorPallet.secondary.shade500,
    onSecondary: ColorPallet.white,
    primaryContainer: ColorPallet.primary.shade500,
    onPrimaryContainer: ColorPallet.white,
    outline: ColorPallet.neutral.shade400,
    outlineBackground: ColorPallet.white,
    onOutline: ColorPallet.primary.shade500,
    disable: ColorPallet.primary.shade100,
    disableContainer: ColorPallet.primary.shade200,
    error: ColorPallet.error.shade500,
    errorContainer: ColorPallet.error.shade100,
  );

  static final _darkThemeColor = ButtonColor._(
    primary: ColorPallet.primary.shade400,
    onPrimary: ColorPallet.white,
    secondary: ColorPallet.secondary.shade500,
    onSecondary: ColorPallet.white,
    primaryContainer: ColorPallet.primary.shade500,
    onPrimaryContainer: ColorPallet.white,
    outline: ColorPallet.neutral.shade600,
    outlineBackground: ColorPallet.white,
    onOutline: ColorPallet.white,
    disable: ColorPallet.primary.shade100,
    disableContainer: ColorPallet.primary.shade200,
    error: ColorPallet.error.shade500,
    errorContainer: ColorPallet.error.shade100,
  );
}
