import 'package:flutter/material.dart';

final class ColorPallet {
  // Private constructor to prevent instantiation
  ColorPallet._();

  // Primary Palette (Violet)
  static const MaterialColor primary = MaterialColor(0xFF101533, {
    50: Color(0xFFE2E4EA),
    100: Color(0xFFB6BDCD),
    200: Color(0xFF8691AE),
    300: Color(0xFF56658F),
    400: Color(0xFF324377),
    500: Color(0xFF101533),
    600: Color(0xFF0E132E),
    700: Color(0xFF0B0F27),
    800: Color(0xFF080C21),
    900: Color(0xFF040616),
  });

  // Secondary Palette (Teal)
  static const MaterialColor secondary = MaterialColor(0xFF009688, {
    50: Color(0xFFE0F2F1),
    100: Color(0xFFB2DFDB),
    200: Color(0xFF80CBC4),
    300: Color(0xFF4DB6AC),
    400: Color(0xFF26A69A),
    500: Color(0xFF009688),
    600: Color(0xFF00897B),
    700: Color(0xFF00796B),
    800: Color(0xFF00695C),
    900: Color(0xFF004D40),
  });

  // Neutral Palette (Grey)
  static const MaterialColor neutral = MaterialColor(0xFF9E9E9E, {
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFEEEEEE),
    300: Color(0xFFE0E0E0),
    400: Color(0xFFBDBDBD),
    500: Color(0xFF9E9E9E),
    600: Color(0xFF757575),
    700: Color(0xFF616161),
    800: Color(0xFF424242),
    900: Color(0xFF212121),
    950: Color(0xFF101010),
  });

  // Error Palette (Red)
  static const MaterialColor error = MaterialColor(0xFFF44336, {
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(0xFFF44336),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  });

  // Success Palette (Green)
  static const MaterialColor success = MaterialColor(0xFF4CAF50, {
    50: Color(0xFFE8F5E9),
    100: Color(0xFFC8E6C9),
    200: Color(0xFFA5D6A7),
    300: Color(0xFF81C784),
    400: Color(0xFF66BB6A),
    500: Color(0xFF4CAF50),
    600: Color(0xFF43A047),
    700: Color(0xFF388E3C),
    800: Color(0xFF2E7D32),
    900: Color(0xFF1B5E20),
  });

  // Warning Palette (Amber)
  static const MaterialColor warning = MaterialColor(0xFFFFC107, {
    50: Color(0xFFFFF8E1),
    100: Color(0xFFFFECB3),
    200: Color(0xFFFFE082),
    300: Color(0xFFFFD54F),
    400: Color(0xFFFFCA28),
    500: Color(0xFFFFC107),
    600: Color(0xFFFFB300),
    700: Color(0xFFFFA000),
    800: Color(0xFFFF8F00),
    900: Color(0xFFFF6F00),
  });

  // Info Palette (Blue)
  static const MaterialColor info = MaterialColor(0xFF2196F3, {
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  });

  static const MaterialColor green = MaterialColor(0xFF228E57, {
    50: Color(0xFFE4F2E8),
    100: Color(0xFFBCDEC5),
    200: Color(0xFF90C9A0),
    300: Color(0xFF64B37A),
    400: Color(0xFF43A368),
    500: Color(0xFF228E57),
    600: Color(0xFF1E864F),
    700: Color(0xFF197B46),
    800: Color(0xFF14713C),
    900: Color(0xFF0B5F2C),
  });

  static const MaterialColor teal = MaterialColor(0xFF00C0B8, {
    50: Color(0xFFE0F7F6),
    100: Color(0xFFB3EBE9),
    200: Color(0xFF80DED9),
    300: Color(0xFF4DD0CA),
    400: Color(0xFF26C6C1),
    500: Color(0xFF00C0B8),
    600: Color(0xFF00B3AB),
    700: Color(0xFF00A39C),
    800: Color(0xFF00938D),
    900: Color(0xFF007670),
  });

  // Red
  static const MaterialColor red = MaterialColor(0xFFC23D51, {
    50: Color(0xFFFBEBEC),
    100: Color(0xFFF5CDD4),
    200: Color(0xFFEEABBA),
    300: Color(0xFFE7899F),
    400: Color(0xFFE2708B),
    500: Color(0xFFC23D51),
    600: Color(0xFFB0374A),
    700: Color(0xFF9A3041),
    800: Color(0xFF852938),
    900: Color(0xFF601D28),
  });

  // Orange
  static const MaterialColor orange = MaterialColor(0xFFFF7A00, {
    50: Color(0xFFFFF2E0),
    100: Color(0xFFFFDEB3),
    200: Color(0xFFFFC980),
    300: Color(0xFFFFB34D),
    400: Color(0xFFFFA326),
    500: Color(0xFFFF7A00),
    600: Color(0xFFE66E00),
    700: Color(0xFFCC6200),
    800: Color(0xFFB35600),
    900: Color(0xFF803D00),
  });

  // Amber
  static const MaterialColor amber = MaterialColor(0xFFFFB800, {
    50: Color(0xFFFFF8E0),
    100: Color(0xFFFFEDB3),
    200: Color(0xFFFFE180),
    300: Color(0xFFFFD54D),
    400: Color(0xFFFFCC26),
    500: Color(0xFFFFB800),
    600: Color(0xFFE6A600),
    700: Color(0xFFCC9300),
    800: Color(0xFFB38100),
    900: Color(0xFF805C00),
  });

  // Indigo
  static const MaterialColor indigo = MaterialColor(0xFF5856D6, {
    50: Color(0xFFEEEEFB),
    100: Color(0xFFD5D4F5),
    200: Color(0xFFB9B7EF),
    300: Color(0xFF9D9AE9),
    400: Color(0xFF8885E4),
    500: Color(0xFF5856D6),
    600: Color(0xFF504ED2),
    700: Color(0xFF4744CC),
    800: Color(0xFF3D3BC6),
    900: Color(0xFF2D2BBC),
  });

  // Violet
  static const MaterialColor violet = MaterialColor(0xFF8A2BE2, {
    50: Color(0xFFF3E6FC),
    100: Color(0xFFE2C0F7),
    200: Color(0xFFCE96F2),
    300: Color(0xFFBA6CED),
    400: Color(0xFFAA4DE9),
    500: Color(0xFF8A2BE2),
    600: Color(0xFF8226DA),
    700: Color(0xFF7720CF),
    800: Color(0xFF6D1AC5),
    900: Color(0xFF5A10B3),
  });

  // Common
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
}
