import 'package:flutter/material.dart';

import '../../dimensions/dimension_aggregator.dart';
import '../../typo/app_typography.dart';
import '../colors/app_colors_aggregator.dart';


final class AppLightTheme {
  const AppLightTheme._();

  static ThemeData themeData() {
    final materialTokens = AppColorsAggregator.lightThemeColors.appColor;
    final appBarTokens = AppColorsAggregator.lightThemeColors.appBarColor;

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: materialTokens.primary,
        onPrimary: materialTokens.onPrimary,
        primaryContainer: materialTokens.primaryContainer,
        onPrimaryContainer: materialTokens.onPrimaryContainer,
        secondary: materialTokens.secondary,
        onSecondary: materialTokens.onSecondary,
        secondaryContainer: materialTokens.secondaryContainer,
        onSecondaryContainer: materialTokens.onSecondaryContainer,
        tertiary: materialTokens.tertiary,
        onTertiary: materialTokens.onTertiary,
        error: materialTokens.error,
        onError: materialTokens.onError,
        surface: materialTokens.surface,
        onSurface: materialTokens.onSurface,
        inverseSurface: materialTokens.inverseSurface,
        onInverseSurface: materialTokens.onInverseSurface,
      ),
      fontFamily: "Poppins",
      extensions: [
        AppColorsAggregator.lightThemeColors,
        DimensionAggregator.instance,
        AppTypography.instance,
      ],
      appBarTheme: AppBarTheme(
        backgroundColor: appBarTokens.secondaryContainer,
        titleTextStyle: AppTypography.instance.titleSmallMedium
            .copyWith(color: appBarTokens.onSecondaryContainer),
        shadowColor: Colors.white,
        scrolledUnderElevation: 0.1,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
