import 'package:flutter/material.dart';

import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';

/// A standard app bar implementation with consistent styling.
class AppToolbar extends StatelessWidget implements PreferredSizeWidget {
  /// The title text.
  final String title;

  /// Whether to show the back button. Defaults to true.
  final bool isBackButtonVisible;

  /// Callback when the back button is pressed.
  final VoidCallback? onClickBackButton;

  const AppToolbar({
    super.key,
    required this.title,
    this.isBackButtonVisible = true,
    this.onClickBackButton,
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(title, style: context.typography.titleMediumSemiBold),
      backgroundColor: context.appBarColors.primaryContainer,
      centerTitle: true,
      foregroundColor: context.appBarColors.onPrimaryContainer,
      leading: isBackButtonVisible
          ? IconButton(
              onPressed: onClickBackButton,
              icon: const Icon(Icons.arrow_back_ios_new_sharp),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
