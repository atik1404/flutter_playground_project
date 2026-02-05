import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'foundations/app_dimensions.dart';
import 'tokens/app_colors.dart';
import 'tokens/app_typography.dart';
import 'tokens/app_spacing.dart';
import 'components/button_theme.dart';
import 'components/input_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _createTheme(Brightness.light);
  static ThemeData get dark => _createTheme(Brightness.dark);

  static ThemeData _createTheme(Brightness brightness) {
    // 1. Initialize Semantic Colors
    final colors = brightness == Brightness.light
        ? AppColorsExtension.light()
        : AppColorsExtension.dark();

    // 2. Initialize Semantic Typography (linked to colors)
    final typography = AppTypographyExtension.fromColors(colors);

    // 3. Initialize Semantic Spacing
    // Spacing is now handled statically via AppSpacing class

    // 4. Initialize Component Themes (linked to colors and typography)
    final buttonTheme = AppButtonExtension.fromColors(colors, typography);
    final inputTheme = AppInputExtension.fromColors(colors, typography);

    // 5. Construct Flutter ThemeData
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colors.background,

      // Map Semantic Colors to ColorScheme
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.borderFocus, // Using primary for standard widgets
        onPrimary: colors.textInverse,
        secondary: colors.borderFocus, // Can adjust if secondary needed
        onSecondary: colors.textInverse,
        error: colors.error,
        onError: colors.textInverse,
        surface: colors.surface,
        onSurface: colors.textPrimary,
        outline: colors.border,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: colors.borderFocus, // Primary color
        foregroundColor: colors.textInverse,
        elevation: 0,
        centerTitle: false,
        systemOverlayStyle: brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle
                  .light, // Usually light content on dark/primary bg
        titleTextStyle: typography.titleLarge.copyWith(
          color: colors.textInverse,
        ),
        iconTheme: IconThemeData(color: colors.textInverse),
      ),

      // Divider Theme
      dividerColor: colors.border,
      dividerTheme: DividerThemeData(
        color: colors.border,
        thickness: AppDimensions.dividerThickness,
        space: AppSpacing.value(SpaceToken.m),
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: colors.textPrimary,
        size: AppDimensions.icon24, // 24.0 based on foundations
      ),

      // Text Theme (mapped from our Semantic Typography)
      textTheme: TextTheme(
        displayLarge: typography.displayLarge,
        displayMedium: typography.displayMedium,
        displaySmall: typography.displaySmall,
        headlineLarge: typography.headlineLarge,
        headlineMedium: typography.headlineMedium,
        headlineSmall: typography.headlineSmall,
        titleLarge: typography.titleLarge,
        titleMedium: typography.titleMedium,
        titleSmall: typography.titleSmall,
        bodyLarge: typography.bodyLarge,
        bodyMedium: typography.bodyMedium,
        bodySmall: typography.bodySmall,
        labelLarge: typography.labelLarge,
        labelSmall: typography.labelSmall,
      ),

      // InputDecorationTheme (TextFields)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputTheme.enabled.backgroundColor,
        contentPadding: AppSpacing.all(SpaceToken.m),
        hintStyle: inputTheme.enabled.textStyle?.copyWith(
          color: colors.textDisabled,
        ),
        border: _inputBorder(inputTheme.enabled.borderColor!),
        enabledBorder: _inputBorder(inputTheme.enabled.borderColor!),
        focusedBorder: _inputBorder(inputTheme.focused.borderColor!, width: 2),
        errorBorder: _inputBorder(inputTheme.error.borderColor!),
        disabledBorder: _inputBorder(Colors.transparent),
      ),

      // ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonTheme.primary.backgroundColor,
          foregroundColor: buttonTheme.primary.foregroundColor,
          textStyle: buttonTheme.primary.textStyle,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.value(SpaceToken.l),
            vertical: AppSpacing.value(SpaceToken.m),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius8),
          ),
          elevation: 0,
        ),
      ),

      // OutlinedButton Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonTheme.outline.backgroundColor,
          foregroundColor: buttonTheme.outline.foregroundColor,
          textStyle: buttonTheme.outline.textStyle,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.value(SpaceToken.l),
            vertical: AppSpacing.value(SpaceToken.m),
          ),
          side: BorderSide(color: buttonTheme.outline.borderColor!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius8),
          ),
        ),
      ),

      // TextButton Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: buttonTheme.ghost.backgroundColor,
          foregroundColor: buttonTheme.ghost.foregroundColor,
          textStyle: buttonTheme.ghost.textStyle,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.value(SpaceToken.s),
            vertical: AppSpacing.value(SpaceToken.s),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius4),
          ),
        ),
      ),

      // Extensions
      extensions: [colors, typography, buttonTheme, inputTheme],
    );
  }

  static OutlineInputBorder _inputBorder(Color color, {double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radius8),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
