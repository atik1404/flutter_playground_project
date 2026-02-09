import 'package:flutter/material.dart';

/// A simple widget to create space (sized box) with specific width and height.
///
/// Useful for adding gaps between widgets in Rows or Columns.
class SpacerBox extends StatelessWidget {
  /// The width of the space.
  final double width;

  /// The height of the space.
  final double height;

  const SpacerBox({this.width = 0.0, this.height = 0.0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}
