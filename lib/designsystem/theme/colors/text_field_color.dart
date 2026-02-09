part of 'app_colors_aggregator.dart';

final class TextFieldColor extends ThemeExtension<TextFieldColor>
    with ColorFieldsMixin<TextFieldColor> {
  final Color fillColor;
  final Color hintColor;
  final Color error;
  final Color focusedBorderColor;
  final Color disableBorderColor;

  TextFieldColor._({
    required this.fillColor,
    required this.hintColor,
    required this.focusedBorderColor,
    required this.disableBorderColor,
    required this.error,
  });

  @override
  ThemeExtension<TextFieldColor> copyWith({
    Color? fillColor,
    Color? hintColor,
    Color? focusedBorderColor,
    Color? disableBorderColor,
    Color? error,
  }) {
    return copyWithList([
      fillColor,
      hintColor,
      focusedBorderColor,
      disableBorderColor,
      error,
    ]);
  }

  @override
  List<Color> get colorFields => [
    fillColor,
    hintColor,
    focusedBorderColor,
    disableBorderColor,
    error,
  ];

  @override
  TextFieldColor createInstance(List<Color> colors) {
    return TextFieldColor._(
      fillColor: colors[0],
      hintColor: colors[1],
      focusedBorderColor: colors[2],
      disableBorderColor: colors[3],
      error: colors[4],
    );
  }

  static final _lightThemeColor = TextFieldColor._(
    fillColor: ColorPallet.neutral.shade100,
    hintColor: ColorPallet.neutral.shade300,
    focusedBorderColor: ColorPallet.neutral.shade300,
    disableBorderColor: ColorPallet.neutral.shade200,
    error: ColorPallet.error.shade400,
  );

  static final _darkThemeColor = TextFieldColor._(
    fillColor: ColorPallet.neutral.shade100,
    hintColor: ColorPallet.neutral.shade300,
    focusedBorderColor: ColorPallet.neutral.shade300,
    disableBorderColor: ColorPallet.neutral.shade200,
    error: ColorPallet.error.shade400 ,
  );
}
