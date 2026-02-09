part of 'dimension_aggregator.dart';

/// Defines the standard image/avatar size tokens for the application design system.
///
/// This extension standardizes the dimensions of images, avatars, and thumbnails
/// to ensure consistent visual rhythm across lists, profiles, and media views.
final class ImageSize extends ThemeExtension<ImageSize>
    with NumericFieldsMixin<ImageSize> {
  /// Extra Extra Small image (e.g., 16px).
  /// Used for tiny inline avatars, status badges, or dense data table images.
  final double xxs;

  /// Extra Small image (e.g., 24px).
  /// Used for small user avatars in comments, chips, or dense list tiles.
  final double xs;

  /// Small image (e.g., 32px).
  /// Used for standard list item leading images, author avatars, or small thumbnails.
  final double sm;

  /// Medium/Standard image (e.g., 48px).
  /// The default size for profile pictures, card headers, or standard thumbnails.
  final double md;

  /// Large image (e.g., 80px).
  /// Used for larger list items (e.g., music albums, product previews) or featured profiles.
  final double lg;

  /// Extra Large image (e.g., 120px).
  /// Used for detail view headers, modal illustrations, or grid items.
  final double xl;

  /// Extra Extra Large image (e.g., 200px).
  /// Used for hero images, cover photos, or main product showcases.
  final double xxl;

  const ImageSize._({
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  @override
  ThemeExtension<ImageSize> copyWith({
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return createInstance([
      xxs ?? this.xxs,
      xs ?? this.xs,
      sm ?? this.sm,
      md ?? this.md,
      lg ?? this.lg,
      xl ?? this.xl,
      xxl ?? this.xxl,
    ]);
  }

  @override
  ImageSize createInstance(List<double> values) {
    return ImageSize._(
      xxs: values[0],
      xs: values[1],
      sm: values[2],
      md: values[3],
      lg: values[4],
      xl: values[5],
      xxl: values[6],
    );
  }

  @override
  List<double> get numericFields => [xxs, xs, sm, md, lg, xl, xxl];

  /// The default standard instance of [ImageSize].
  static const _standard = ImageSize._(
    xxs: 16,
    xs: 24,
    sm: 32,
    md: 48, // Standard avatar size
    lg: 80, // Standard thumbnail size
    xl: 120,
    xxl: 200,
  );
}
