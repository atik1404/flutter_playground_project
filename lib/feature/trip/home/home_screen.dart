import 'package:flutter/material.dart';
import 'package:playground_flutter_project/feature/trip/home/widgets/home_toolbar.dart';
import 'package:playground_flutter_project/ui/components/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          const HomeToolbar(),
          Expanded(child: Center(child: Text("Home Screen Content"))),
        ],
      ),
    );
  }
}
