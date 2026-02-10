import 'package:flutter/material.dart';
import 'package:playground_flutter_project/ui/components/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: const Center(child: Text("Home Screen")));
  }
}
