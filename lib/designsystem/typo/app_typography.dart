import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playground_flutter_project/designsystem/theme/utils/text_style_fields_mixin.dart';

/// Defines the typography system for the application.
///
/// This extension provides a consistent set of text styles categorized by size
/// (Title Large/Medium/Small, Body Large/Medium/Small/ExtraSmall) and weight
/// (Regular, Medium, SemiBold, Bold, Light).
///
/// It uses [TextStyleFieldsMixin] to support theme extension features like
/// `lerp` and `copyWith` efficiently.
final class AppTypography extends ThemeExtension<AppTypography>
    with TextStyleFieldsMixin<AppTypography> {
  // --- Title Large ---

  /// Title Large - Regular (400) - 22sp
  final TextStyle titleLargeRegular;

  /// Title Large - Medium (500) - 22sp
  final TextStyle titleLargeMedium;

  /// Title Large - SemiBold (600) - 22sp
  final TextStyle titleLargeSemiBold;

  /// Title Large - Bold (700) - 22sp
  final TextStyle titleLargeBold;

  /// Title Large - Light (300) - 22sp
  final TextStyle titleLargeLight;

  // --- Title Medium ---

  /// Title Medium - Regular (400) - 20sp
  final TextStyle titleMediumRegular;

  /// Title Medium - Medium (500) - 20sp
  final TextStyle titleMediumMedium;

  /// Title Medium - SemiBold (600) - 20sp
  final TextStyle titleMediumSemiBold;

  /// Title Medium - Bold (700) - 20sp
  final TextStyle titleMediumBold;

  /// Title Medium - Light (300) - 20sp
  final TextStyle titleMediumLight;

  // --- Title Small ---

  /// Title Small - Regular (400) - 18sp
  final TextStyle titleSmallRegular;

  /// Title Small - Medium (500) - 18sp
  final TextStyle titleSmallMedium;

  /// Title Small - SemiBold (600) - 18sp
  final TextStyle titleSmallSemiBold;

  /// Title Small - Bold (700) - 18sp
  final TextStyle titleSmallBold;

  /// Title Small - Light (300) - 18sp
  final TextStyle titleSmallLight;

  // --- Body Large ---

  /// Body Large - Regular (400) - 16sp
  final TextStyle bodyLargeRegular;

  /// Body Large - Medium (500) - 16sp
  final TextStyle bodyLargeMedium;

  /// Body Large - SemiBold (600) - 16sp
  final TextStyle bodyLargeSemiBold;

  /// Body Large - Bold (700) - 16sp
  final TextStyle bodyLargeBold;

  /// Body Large - Light (300) - 16sp
  final TextStyle bodyLargeLight;

  // --- Body Medium ---

  /// Body Medium - Regular (400) - 14sp
  final TextStyle bodyMediumRegular;

  /// Body Medium - Medium (500) - 14sp
  final TextStyle bodyMediumMedium;

  /// Body Medium - SemiBold (600) - 14sp
  final TextStyle bodyMediumSemiBold;

  /// Body Medium - Bold (700) - 14sp
  final TextStyle bodyMediumBold;

  /// Body Medium - Light (300) - 14sp
  final TextStyle bodyMediumLight;

  // --- Body Small ---

  /// Body Small - Regular (400) - 12sp
  final TextStyle bodySmallRegular;

  /// Body Small - Medium (500) - 12sp
  final TextStyle bodySmallMedium;

  /// Body Small - SemiBold (600) - 12sp
  final TextStyle bodySmallSemiBold;

  /// Body Small - Bold (700) - 12sp
  final TextStyle bodySmallBold;

  /// Body Small - Light (300) - 12sp
  final TextStyle bodySmallLight;

  // --- Body Extra Small ---

  /// Body Extra Small - Regular (400) - 11sp
  final TextStyle bodyExtraSmallRegular;

  /// Body Extra Small - Medium (500) - 11sp
  final TextStyle bodyExtraSmallMedium;

  /// Body Extra Small - SemiBold (600) - 11sp
  final TextStyle bodyExtraSmallSemiBold;

  /// Body Extra Small - Bold (700) - 11sp
  final TextStyle bodyExtraSmallBold;

  /// Body Extra Small - Light (300) - 11sp
  final TextStyle bodyExtraSmallLight;

  const AppTypography._({
    required this.titleLargeRegular,
    required this.titleLargeMedium,
    required this.titleLargeSemiBold,
    required this.titleLargeBold,
    required this.titleLargeLight,
    required this.titleMediumRegular,
    required this.titleMediumMedium,
    required this.titleMediumSemiBold,
    required this.titleMediumBold,
    required this.titleMediumLight,
    required this.titleSmallRegular,
    required this.titleSmallMedium,
    required this.titleSmallSemiBold,
    required this.titleSmallBold,
    required this.titleSmallLight,
    required this.bodyLargeRegular,
    required this.bodyLargeMedium,
    required this.bodyLargeSemiBold,
    required this.bodyLargeBold,
    required this.bodyLargeLight,
    required this.bodyMediumRegular,
    required this.bodyMediumMedium,
    required this.bodyMediumSemiBold,
    required this.bodyMediumBold,
    required this.bodyMediumLight,
    required this.bodySmallRegular,
    required this.bodySmallMedium,
    required this.bodySmallSemiBold,
    required this.bodySmallBold,
    required this.bodySmallLight,
    required this.bodyExtraSmallRegular,
    required this.bodyExtraSmallMedium,
    required this.bodyExtraSmallSemiBold,
    required this.bodyExtraSmallBold,
    required this.bodyExtraSmallLight,
  });

  @override
  AppTypography createInstance(List<TextStyle> styles) {
    return AppTypography._(
      titleLargeRegular: styles[0],
      titleLargeMedium: styles[1],
      titleLargeSemiBold: styles[2],
      titleLargeBold: styles[3],
      titleLargeLight: styles[4],
      titleMediumRegular: styles[5],
      titleMediumMedium: styles[6],
      titleMediumSemiBold: styles[7],
      titleMediumBold: styles[8],
      titleMediumLight: styles[9],
      titleSmallRegular: styles[10],
      titleSmallMedium: styles[11],
      titleSmallSemiBold: styles[12],
      titleSmallBold: styles[13],
      titleSmallLight: styles[14],
      bodyLargeRegular: styles[15],
      bodyLargeMedium: styles[16],
      bodyLargeSemiBold: styles[17],
      bodyLargeBold: styles[18],
      bodyLargeLight: styles[19],
      bodyMediumRegular: styles[20],
      bodyMediumMedium: styles[21],
      bodyMediumSemiBold: styles[22],
      bodyMediumBold: styles[23],
      bodyMediumLight: styles[24],
      bodySmallRegular: styles[25],
      bodySmallMedium: styles[26],
      bodySmallSemiBold: styles[27],
      bodySmallBold: styles[28],
      bodySmallLight: styles[29],
      bodyExtraSmallRegular: styles[30],
      bodyExtraSmallMedium: styles[31],
      bodyExtraSmallSemiBold: styles[32],
      bodyExtraSmallBold: styles[33],
      bodyExtraSmallLight: styles[34],
    );
  }

  @override
  List<TextStyle> get textStyleFields => [
    titleLargeRegular,
    titleLargeMedium,
    titleLargeSemiBold,
    titleLargeBold,
    titleLargeLight,
    titleMediumRegular,
    titleMediumMedium,
    titleMediumSemiBold,
    titleMediumBold,
    titleMediumLight,
    titleSmallRegular,
    titleSmallMedium,
    titleSmallSemiBold,
    titleSmallBold,
    titleSmallLight,
    bodyLargeRegular,
    bodyLargeMedium,
    bodyLargeSemiBold,
    bodyLargeBold,
    bodyLargeLight,
    bodyMediumRegular,
    bodyMediumMedium,
    bodyMediumSemiBold,
    bodyMediumBold,
    bodyMediumLight,
    bodySmallRegular,
    bodySmallMedium,
    bodySmallSemiBold,
    bodySmallBold,
    bodySmallLight,
    bodyExtraSmallRegular,
    bodyExtraSmallMedium,
    bodyExtraSmallSemiBold,
    bodyExtraSmallBold,
    bodyExtraSmallLight,
  ];

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? titleLargeRegular,
    TextStyle? titleLargeMedium,
    TextStyle? titleLargeSemiBold,
    TextStyle? titleLargeBold,
    TextStyle? titleLargeLight,
    TextStyle? titleMediumRegular,
    TextStyle? titleMediumMedium,
    TextStyle? titleMediumSemiBold,
    TextStyle? titleMediumBold,
    TextStyle? titleMediumLight,
    TextStyle? titleSmallRegular,
    TextStyle? titleSmallMedium,
    TextStyle? titleSmallSemiBold,
    TextStyle? titleSmallBold,
    TextStyle? titleSmallLight,
    TextStyle? bodyLargeRegular,
    TextStyle? bodyLargeMedium,
    TextStyle? bodyLargeSemiBold,
    TextStyle? bodyLargeBold,
    TextStyle? bodyLargeLight,
    TextStyle? bodyMediumRegular,
    TextStyle? bodyMediumMedium,
    TextStyle? bodyMediumSemiBold,
    TextStyle? bodyMediumBold,
    TextStyle? bodyMediumLight,
    TextStyle? bodySmallRegular,
    TextStyle? bodySmallMedium,
    TextStyle? bodySmallSemiBold,
    TextStyle? bodySmallBold,
    TextStyle? bodySmallLight,
    TextStyle? bodyExtraSmallRegular,
    TextStyle? bodyExtraSmallMedium,
    TextStyle? bodyExtraSmallSemiBold,
    TextStyle? bodyExtraSmallBold,
    TextStyle? bodyExtraSmallLight,
  }) {
    return copyWithList([
      titleLargeRegular,
      titleLargeMedium,
      titleLargeSemiBold,
      titleLargeBold,
      titleLargeLight,
      titleMediumRegular,
      titleMediumMedium,
      titleMediumSemiBold,
      titleMediumBold,
      titleMediumLight,
      titleSmallRegular,
      titleSmallMedium,
      titleSmallSemiBold,
      titleSmallBold,
      titleSmallLight,
      bodyLargeRegular,
      bodyLargeMedium,
      bodyLargeSemiBold,
      bodyLargeBold,
      bodyLargeLight,
      bodyMediumRegular,
      bodyMediumMedium,
      bodyMediumSemiBold,
      bodyMediumBold,
      bodyMediumLight,
      bodySmallRegular,
      bodySmallMedium,
      bodySmallSemiBold,
      bodySmallBold,
      bodySmallLight,
      bodyExtraSmallRegular,
      bodyExtraSmallMedium,
      bodyExtraSmallSemiBold,
      bodyExtraSmallBold,
      bodyExtraSmallLight,
    ]);
  }

  /// The standard typography instance for the application.
  ///
  /// Uses "Roboto" font family and defines sizes in `sp` (screenutil).
  static final instance = AppTypography._(
    titleLargeRegular: _getTypoStyle(30, FontWeight.w400),
    titleLargeMedium: _getTypoStyle(30, FontWeight.w500),
    titleLargeSemiBold: _getTypoStyle(30, FontWeight.w600),
    titleLargeBold: _getTypoStyle(30, FontWeight.w700),
    titleLargeLight: _getTypoStyle(30, FontWeight.w300),

    titleMediumRegular: _getTypoStyle(22, FontWeight.w400),
    titleMediumMedium: _getTypoStyle(22, FontWeight.w500),
    titleMediumSemiBold: _getTypoStyle(22, FontWeight.w600),
    titleMediumBold: _getTypoStyle(22, FontWeight.w700),
    titleMediumLight: _getTypoStyle(22, FontWeight.w300),

    titleSmallRegular: _getTypoStyle(18, FontWeight.w400),
    titleSmallMedium: _getTypoStyle(18, FontWeight.w500),
    titleSmallSemiBold: _getTypoStyle(18, FontWeight.w600),
    titleSmallBold: _getTypoStyle(18, FontWeight.w700),
    titleSmallLight: _getTypoStyle(18, FontWeight.w300),

    bodyLargeRegular: _getTypoStyle(16, FontWeight.w400),
    bodyLargeMedium: _getTypoStyle(16, FontWeight.w500),
    bodyLargeSemiBold: _getTypoStyle(16, FontWeight.w600),
    bodyLargeBold: _getTypoStyle(16, FontWeight.w700),
    bodyLargeLight: _getTypoStyle(16, FontWeight.w300),

    bodyMediumRegular: _getTypoStyle(14, FontWeight.w400),
    bodyMediumMedium: _getTypoStyle(14, FontWeight.w500),
    bodyMediumSemiBold: _getTypoStyle(14, FontWeight.w600),
    bodyMediumBold: _getTypoStyle(14, FontWeight.w700),
    bodyMediumLight: _getTypoStyle(14, FontWeight.w300),

    bodySmallRegular: _getTypoStyle(12, FontWeight.w400),
    bodySmallMedium: _getTypoStyle(12, FontWeight.w500),
    bodySmallSemiBold: _getTypoStyle(12, FontWeight.w600),
    bodySmallBold: _getTypoStyle(12, FontWeight.w700),
    bodySmallLight: _getTypoStyle(12, FontWeight.w300),

    bodyExtraSmallRegular: _getTypoStyle(10, FontWeight.w400),
    bodyExtraSmallMedium: _getTypoStyle(10, FontWeight.w500),
    bodyExtraSmallSemiBold: _getTypoStyle(10, FontWeight.w600),
    bodyExtraSmallBold: _getTypoStyle(10, FontWeight.w700),
    bodyExtraSmallLight: _getTypoStyle(10, FontWeight.w300),
  );

  static TextStyle _getTypoStyle(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: "Roboto",
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      height: 1.2,
    );
  }
}
