part of 'app_colors_aggregator.dart';

final class TextFieldColor extends ThemeExtension<TextFieldColor>
    with ColorFieldsMixin<TextFieldColor> {
  /// The background color of the filled text field.
  final Color fill;

  /// The color of the input text.
  final Color input;

  /// The color of the hint text.
  final Color hint;

  /// The color of the floating label.
  final Color label;

  /// The color used to indicate error on text fields.
  final Color error;

  /// The border color when the text field is enabled (default state).
  final Color enabledBorder;

  /// The border color when the text field is focused.
  final Color focusedBorder;

  /// The border color when the text field is in error state.
  final Color errorBorder;

  /// The content color (text/icon) when the text field is disabled.
  final Color disabled;

  /// The border color when the text field is disabled.
  final Color disabledBorder;

  const TextFieldColor._({
    required this.fill,
    required this.input,
    required this.hint,
    required this.label,
    required this.error,
    required this.enabledBorder,
    required this.focusedBorder,
    required this.errorBorder,
    required this.disabled,
    required this.disabledBorder,
  });

  @override
  TextFieldColor copyWith({
    Color? fill,
    Color? input,
    Color? hint,
    Color? label,
    Color? error,
    Color? enabledBorder,
    Color? focusedBorder,
    Color? errorBorder,
    Color? disabled,
    Color? disabledBorder,
  }) {
    return copyWithList([
      fill,
      input,
      hint,
      label,
      error,
      enabledBorder,
      focusedBorder,
      errorBorder,
      disabled,
      disabledBorder,
    ]);
  }

  @override
  List<Color> get colorFields => [
    fill,
    input,
    hint,
    label,
    error,
    enabledBorder,
    focusedBorder,
    errorBorder,
    disabled,
    disabledBorder,
  ];

  @override
  TextFieldColor createInstance(List<Color> colors) {
    return TextFieldColor._(
      fill: colors[0],
      input: colors[1],
      hint: colors[2],
      label: colors[3],
      error: colors[4],
      enabledBorder: colors[5],
      focusedBorder: colors[6],
      errorBorder: colors[7],
      disabled: colors[8],
      disabledBorder: colors[9],
    );
  }

  static final _lightThemeColor = TextFieldColor._(
    fill: ColorPallet.neutral.shade50,
    input: ColorPallet.neutral.shade900,
    hint: ColorPallet.neutral.shade600,
    label: ColorPallet.neutral.shade600,
    error: ColorPallet.error.shade500,
    enabledBorder: ColorPallet.neutral.shade300,
    focusedBorder: ColorPallet.primary.shade500,
    errorBorder: ColorPallet.error.shade500,
    disabled: ColorPallet.neutral.shade400,
    disabledBorder: ColorPallet.neutral.shade200,
  );

  static final _darkThemeColor = TextFieldColor._(
    fill: ColorPallet.neutral.shade900,
    input: ColorPallet.white,
    hint: ColorPallet.neutral.shade600,
    label: ColorPallet.neutral.shade400,
    error: ColorPallet.error.shade400,
    enabledBorder: ColorPallet.neutral.shade700,
    focusedBorder: ColorPallet.primary.shade400,
    errorBorder: ColorPallet.error.shade400,
    disabled: ColorPallet.neutral.shade600,
    disabledBorder: ColorPallet.neutral.shade800,
  );
}
