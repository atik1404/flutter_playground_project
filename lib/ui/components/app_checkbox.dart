import 'package:flutter/material.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';

/// A wrapper around [Checkbox] with standard app styling and layout.
class AppCheckbox extends StatelessWidget {
  /// Whether the checkbox is checked.
  final bool value;

  /// Callback when the value changes.
  final ValueChanged<bool?> onChanged;

  /// The label to display next to the checkbox.
  final Widget labelText;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: context.appColors.primary,
          checkColor: context.appColors.onPrimary,
        ),
        Flexible(child: labelText),
      ],
    );
  }
}
