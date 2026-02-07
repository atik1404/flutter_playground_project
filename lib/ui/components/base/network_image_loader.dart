import 'package:flutter/material.dart';

import '../../../designsystem/extensions/theme_context_extension.dart';

class NetworkImageLoader extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
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
        borderRadius: BorderRadius.circular(context.shapeRadius.medium),
        child: Image.asset(
          "AppImages.imgErrorPlaceholder",
          height: height,
          fit: fit,
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
