import 'package:flutter/material.dart';
import 'package:playground_flutter_project/ui/components/base/app_button.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppButton.filled(
            width: double.infinity,
            label: "Login",
            onPressed: () => {},                                                                                                                                            
            isLoading: false,
          ),

          // Usage 4: Button (Uses bodyMediumSemiBold internally)
          AppButton.filled(label: "Submit", onPressed: () {}),
        ],
      ),
    );
  }
}
