import 'package:flutter/material.dart';

import 'package:playground_flutter_project/designsystem/dimensions/dimension_aggregator.dart';
import 'package:playground_flutter_project/designsystem/typo/app_typography.dart';
import 'package:playground_flutter_project/designsystem/theme/colors/app_colors_aggregator.dart';

final class AppDarkTheme {
  static ThemeData themeData() {
    final materialTokens = AppColorsAggregator.darkThemeColor.appColor;
    final appBarTokens = AppColorsAggregator.darkThemeColor.appBarColor;

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
      fontFamily: "Roboto",
      extensions: [
        AppColorsAggregator.darkThemeColor,
        DimensionAggregator.instance,
        AppTypography.instance,
      ],
      appBarTheme: AppBarTheme(
        backgroundColor: appBarTokens.primaryContainer,
        foregroundColor: appBarTokens.onPrimaryContainer,
        titleTextStyle: AppTypography.instance.titleLargeBold,
      ),
    );
  }
}
