import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/designsystem/resources/app_animation.dart';

class FullScreenLoader extends StatelessWidget {
  final double opacity;
  const FullScreenLoader({super.key, this.opacity = 0.5});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Block interaction and add opacity
        ModalBarrier(
          color: context.appBarColors.primaryContainer.withAlpha(10),
          dismissible: false,
        ),
        // Centered loader animation
        Center(
          child: Lottie.asset(
            AppAnimation.loadingAnim,
            width: 120,
            height: 120,
            fit: BoxFit.contain,
            repeat: true,
          ),
        ),
      ],
    );
  }
}
