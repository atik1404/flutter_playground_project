import 'package:flutter/material.dart';

/// A widget that displays text with multiple styles using [RichText].
class MultiColorText extends StatelessWidget {
  /// The list of text spans to display.
  final List<TextSpan> textSpans;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// The default style to apply to text spans that don't specify one.
  final TextStyle? defaultStyle;

  const MultiColorText({
    super.key,
    required this.textSpans,
    this.textAlign = TextAlign.start,
    this.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: defaultStyle ?? DefaultTextStyle.of(context).style,
        children: textSpans,
      ),
    );
  }
}
