import 'package:flutter/material.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/scaffold_appbar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldAppbar(body: Center(child: AppText("Splash Screen")));
  }
}
