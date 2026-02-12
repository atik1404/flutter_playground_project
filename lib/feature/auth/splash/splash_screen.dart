import 'package:flutter/material.dart';
import 'package:playground_flutter_project/ui/common/error_ui.dart';
import 'package:playground_flutter_project/ui/components/app_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ErrorUi(errorMessage: "Something went wrong", onRetry: () {}),
    );
  }
}
