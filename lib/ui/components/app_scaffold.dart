import 'package:flutter/material.dart';

/// A wrapper scaffold with consistent app bar and navigation bar handling.
class AppScaffold extends StatelessWidget {
  /// The app bar to display.
  final PreferredSizeWidget? appbar;

  /// The bottom navigation bar to display.
  final NavigationBar? navigationBar;

  /// Actions to display in the app bar (if [appbar] is not provided, though logic suggests this might be unused or for custom app bars).
  /// Note: The current implementation passes [appbar] directly to Scaffold.
  /// If [actions] is intended to be used with a default app bar, logic needs adjustment.
  /// For now, keeping as is but documenting.
  final List<Widget>? actions;

  /// The body of the scaffold.
  final Widget? body;

  /// Whether to center the title (if applicable).
  final bool centerTitle;

  /// Whether to ignore safe area (if true, body is not wrapped in SafeArea).
  final bool isIgnoreSafeArea;

  /// Whether to resize body when keyboard appears.
  final bool resizeToAvoidBottomInset;

  const AppScaffold({
    super.key,
    this.appbar,
    this.actions,
    required this.body,
    this.centerTitle = true,
    this.isIgnoreSafeArea = false,
    this.resizeToAvoidBottomInset = false,
    this.navigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final bodyContent = _buildBody();

    return Scaffold(
      appBar: appbar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: isIgnoreSafeArea ? bodyContent : SafeArea(child: bodyContent),
      bottomNavigationBar: navigationBar ?? const SizedBox.shrink(),
    );
  }

  Widget _buildBody() => body ?? Container();
}
