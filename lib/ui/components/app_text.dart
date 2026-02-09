import 'package:flutter/material.dart';

/// A wrapper around [Text] and [RichText] that provides a consistent API for
/// styling and layout within the application.
class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,

    // text
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.letterSpacing,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.textDirection,
    this.semanticsLabel,
    this.textScaler,

    // leading / trailing
    this.leading,
    this.trailing,
    this.leadingIcon,
    this.trailingIcon,
    this.iconSize,
    this.iconColor,
    this.gap = 8,

    // layout
    this.padding = EdgeInsets.zero,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,

    // interaction
    this.onTap,
    this.onLongPress,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.hitTestBehavior = HitTestBehavior.opaque,

    // optional selectable text
    this.selectable = false,
  });

  /// The text to display.
  final String data;

  // text

  /// The style to apply. Merged with other style properties.
  final TextStyle? style;

  /// Custom color override.
  final Color? color;

  /// Custom font size override.
  final double? fontSize;

  /// Custom font weight override.
  final FontWeight? fontWeight;

  /// Custom line height override.
  final double? height;

  /// Custom letter spacing override.
  final double? letterSpacing;

  /// Text alignment.
  final TextAlign? textAlign;

  /// Maximum number of lines.
  final int? maxLines;

  /// Text overflow behavior.
  final TextOverflow? overflow;

  /// Whether the text should soft wrap.
  final bool? softWrap;

  /// The text direction.
  final TextDirection? textDirection;

  /// The semantics label for accessibility.
  final String? semanticsLabel;

  /// The text scaler.
  final TextScaler? textScaler;

  // leading / trailing

  /// A widget to display before the text.
  final Widget? leading;

  /// A widget to display after the text.
  final Widget? trailing;

  /// An icon to display before the text. Used if [leading] is null.
  final IconData? leadingIcon;

  /// An icon to display after the text. Used if [trailing] is null.
  final IconData? trailingIcon;

  /// The size of the leading/trailing icons.
  final double? iconSize;

  /// The color of the leading/trailing icons.
  final Color? iconColor;

  /// The gap between the text and leading/trailing widgets. Defaults to 8.
  final double gap;

  // layout

  /// Padding around the content.
  final EdgeInsetsGeometry padding;

  /// Main axis size of the Row (if leading/trailing widgets are present).
  final MainAxisSize mainAxisSize;

  /// Cross axis alignment of the Row (if leading/trailing widgets are present).
  final CrossAxisAlignment crossAxisAlignment;

  // interaction

  /// Callback when tapped.
  final VoidCallback? onTap;

  /// Callback when long pressed.
  final VoidCallback? onLongPress;

  /// Border radius for the ink well (if tappable).
  final BorderRadius borderRadius;

  /// Hit test behavior for the ink well.
  final HitTestBehavior hitTestBehavior;

  // selectable

  /// Whether the text is selectable.
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    final themeStyle = DefaultTextStyle.of(context).style;

    final effectiveStyle = themeStyle
        .merge(style)
        .copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          letterSpacing: letterSpacing,
        );

    final leadingWidget =
        leading ??
        (leadingIcon == null
            ? null
            : Icon(
                leadingIcon,
                size: iconSize,
                color: iconColor ?? effectiveStyle.color,
              ));

    final trailingWidget =
        trailing ??
        (trailingIcon == null
            ? null
            : Icon(
                trailingIcon,
                size: iconSize,
                color: iconColor ?? effectiveStyle.color,
              ));

    final textWidget = selectable
        ? SelectableText(
            data,
            style: effectiveStyle,
            textAlign: textAlign,
            maxLines: maxLines,
            textDirection: textDirection,
            semanticsLabel: semanticsLabel,
            textScaler: textScaler,
          )
        : Text(
            data,
            style: effectiveStyle,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: overflow,
            softWrap: softWrap,
            textDirection: textDirection,
            semanticsLabel: semanticsLabel,
            textScaler: textScaler,
          );

    final hasSides = leadingWidget != null || trailingWidget != null;

    var content = hasSides
        ? Row(
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              if (leadingWidget != null) ...[
                leadingWidget,
                SizedBox(width: gap),
              ],
              Flexible(child: textWidget),
              if (trailingWidget != null) ...[
                SizedBox(width: gap),
                trailingWidget,
              ],
            ],
          )
        : textWidget;

    content = Padding(padding: padding, child: content);

    if (onTap != null || onLongPress != null) {
      content = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: borderRadius,
          child: content,
        ),
      );
    }

    return content;
  }
}
