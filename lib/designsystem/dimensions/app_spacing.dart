import 'package:flutter/material.dart';

/// A utility class for defining spacing (padding/margin) using [EdgeInsetsDirectional].
class AppSpacing {
  /// Creates an [EdgeInsetsDirectional] with uniform spacing.
  static EdgeInsetsDirectional all(double value) =>
      EdgeInsetsDirectional.all(value);

  /// Creates an [EdgeInsetsDirectional] with horizontal spacing.
  static EdgeInsetsDirectional horizontal(double value) =>
      EdgeInsetsDirectional.symmetric(horizontal: value);

  /// Creates an [EdgeInsetsDirectional] with vertical spacing.
  static EdgeInsetsDirectional vertical(double value) =>
      EdgeInsetsDirectional.symmetric(vertical: value);

  /// Creates an [EdgeInsetsDirectional] with symmetric spacing.
  static EdgeInsetsDirectional symmetric({
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsetsDirectional.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  /// Creates an [EdgeInsetsDirectional] with only specific sides.
  static EdgeInsetsDirectional only({
    double start = 0,
    double top = 0,
    double end = 0,
    double bottom = 0,
  }) {
    return EdgeInsetsDirectional.only(
      start: start,
      top: top,
      end: end,
      bottom: bottom,
    );
  }
}
