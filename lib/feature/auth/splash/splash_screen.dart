import 'package:flutter/material.dart';
import 'package:playground_flutter_project/ui/components/app_scaffold.dart';
import 'package:playground_flutter_project/ui/components/button/app_filled_button.dart';
import 'package:playground_flutter_project/ui/components/textfield/app_filled_text_field.dart';
import 'package:playground_flutter_project/ui/components/textfield/app_outline_text_field.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          const AppFilledTextField(),
          const AppOutlineTextField(),
          AppFilledButton(
            width: double.infinity,
            label: "Login button",
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
