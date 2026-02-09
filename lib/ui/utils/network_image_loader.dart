import 'package:flutter/material.dart';

import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';

/// A wrapper around [Image.network] with loading indicator and error placeholder.
class NetworkImageLoader extends StatelessWidget {
  /// The URL of the image to load.
  final String imageUrl;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// How the image should be inscribed into the space.
  final BoxFit fit;

  const NetworkImageLoader({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => ClipRRect(
        borderRadius: BorderRadius.circular(context.shapeRadius.full),
        child: ColoredBox(
          color: context.appColors.surface, // Placeholder background
          child: const Icon(
            Icons.error_outline,
          ), // Simple error icon for now as asset path was likely wrong
        ),
      ),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                : null,
            color: context.appColors.primary,
          ),
        );
      },
    );
  }
}
