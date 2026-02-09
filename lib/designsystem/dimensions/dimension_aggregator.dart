import 'package:flutter/material.dart';

import 'package:playground_flutter_project/designsystem/theme/utils/numeric_fields_mixin.dart';

part 'icon_size.dart';
part 'divider_size.dart';
part 'spacing_size.dart';
part 'image_size.dart';
part 'radius_size.dart';

final class DimensionAggregator extends ThemeExtension<DimensionAggregator> {
  final IconSize icon;
  final DividerSize line;
  final RadiusSize shape;
  final SpacingSize spacing;
  final ImageSize imageSize;

  const DimensionAggregator._({
    required this.icon,
    required this.line,
    required this.shape,
    required this.spacing,
    required this.imageSize,
  });

  @override
  DimensionAggregator copyWith({
    IconSize? icon,
    DividerSize? line,
    RadiusSize? shape,
    SpacingSize? spacing,
    ImageSize? imageSize,
  }) {
    return DimensionAggregator._(
      icon: icon ?? this.icon,
      line: line ?? this.line,
      shape: shape ?? this.shape,
      spacing: spacing ?? this.spacing,
      imageSize: imageSize ?? this.imageSize,
    );
  }

  @override
  ThemeExtension<DimensionAggregator> lerp(
    covariant ThemeExtension<DimensionAggregator>? other,
    double t,
  ) {
    if (other is! DimensionAggregator) return this;

    return DimensionAggregator._(
      icon: interpolate(icon, other.icon, t) ?? icon,
      line: interpolate(line, other.line, t) ?? line,
      shape: interpolate(shape, other.shape, t) ?? shape,
      spacing: interpolate(spacing, other.spacing, t) ?? spacing,
      imageSize: interpolate(imageSize, other.imageSize, t) ?? imageSize,
    );
  }

  T? interpolate<T extends ThemeExtension<T>>(T? a, T? b, double t) {
    if (a == null || b == null) return a ?? b;

    return a.lerp(b, t) as T;
  }

  static const instance = DimensionAggregator._(
    icon: IconSize._standard,
    line: DividerSize._standard,
    shape: RadiusSize._standard,
    spacing: SpacingSize.standard,
    imageSize: ImageSize._standard,
  );
}
