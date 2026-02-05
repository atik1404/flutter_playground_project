import 'package:flutter/material.dart';
import '../foundations/app_dimensions.dart';

enum SpaceToken {
  none,
  xs,
  s,
  m,
  l,
  xl,
  xxl,
  // Add more as needed
}

class AppSpacing {
  AppSpacing._();

  static double value(SpaceToken token) {
    switch (token) {
      case SpaceToken.none:
        return 0;
      case SpaceToken.xs:
        return AppDimensions.space4;
      case SpaceToken.s:
        return AppDimensions.space8;
      case SpaceToken.m:
        return AppDimensions.space16;
      case SpaceToken.l:
        return AppDimensions.space24;
      case SpaceToken.xl:
        return AppDimensions.space32;
      case SpaceToken.xxl:
        return AppDimensions.space40;
    }
  }

  static double valueWidth(SpaceToken token) => value(token);
  static double valueHeight(SpaceToken token) => value(token);

  static EdgeInsetsDirectional all(SpaceToken t) =>
      EdgeInsetsDirectional.all(value(t));

  static EdgeInsetsDirectional horizontal(SpaceToken t) =>
      EdgeInsetsDirectional.symmetric(horizontal: value(t));

  static EdgeInsetsDirectional vertical(SpaceToken t) =>
      EdgeInsetsDirectional.symmetric(vertical: value(t));

  static EdgeInsetsDirectional symmetric({
    required SpaceToken horizontal,
    required SpaceToken vertical,
  }) {
    return EdgeInsetsDirectional.symmetric(
      horizontal: value(horizontal),
      vertical: value(vertical),
    );
  }

  static EdgeInsetsDirectional only({
    SpaceToken? start,
    SpaceToken? top,
    SpaceToken? end,
    SpaceToken? bottom,
  }) {
    return EdgeInsetsDirectional.only(
      start: start == null ? 0 : value(start),
      top: top == null ? 0 : value(top),
      end: end == null ? 0 : value(end),
      bottom: bottom == null ? 0 : value(bottom),
    );
  }

  // Gaps
  static SizedBox gap(SpaceToken t) =>
      SizedBox(width: value(t), height: value(t));
  static SizedBox gapW(SpaceToken t) => SizedBox(width: valueWidth(t));
  static SizedBox gapH(SpaceToken t) => SizedBox(height: valueHeight(t));
}
