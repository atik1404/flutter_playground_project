import 'package:flutter/material.dart';

/// A generic bundle of tokens that define the visual state of a component part.
/// Can be used for buttons, inputs, cards, etc.
@immutable
class TokenBundle {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final TextStyle? textStyle;

  const TokenBundle({
    required this.backgroundColor,
    required this.foregroundColor,
    this.borderColor,
    this.iconColor,
    this.textStyle,
  });

  TokenBundle copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? iconColor,
    TextStyle? textStyle,
  }) {
    return TokenBundle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderColor: borderColor ?? this.borderColor,
      iconColor: iconColor ?? this.iconColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  static TokenBundle? lerp(TokenBundle? a, TokenBundle? b, double t) {
    if (a == null && b == null) return null;
    return TokenBundle(
      backgroundColor:
          Color.lerp(a?.backgroundColor, b?.backgroundColor, t) ??
          a!.backgroundColor,
      foregroundColor:
          Color.lerp(a?.foregroundColor, b?.foregroundColor, t) ??
          a!.foregroundColor,
      borderColor: Color.lerp(a?.borderColor, b?.borderColor, t),
      iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
    );
  }
}
