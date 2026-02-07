import 'package:flutter/material.dart';

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
    this.locale,
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

  final String data;

  // text
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final Locale? locale;
  final TextDirection? textDirection;
  final String? semanticsLabel;
  final TextScaler? textScaler;

  // leading / trailing
  final Widget? leading;
  final Widget? trailing;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double? iconSize;
  final Color? iconColor;
  final double gap;

  // layout
  final EdgeInsetsGeometry padding;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  // interaction
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final BorderRadius borderRadius;
  final HitTestBehavior hitTestBehavior;

  // selectable
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
            locale: locale,
            textDirection: textDirection,
            semanticsLabel: semanticsLabel,
            textScaler: textScaler,
          );

    final hasSides = leadingWidget != null || trailingWidget != null;

    Widget content = hasSides
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
