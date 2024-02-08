import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircleAvatar extends StatelessWidget {
  final double radius;

  const ShimmerCircleAvatar({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: CircleAvatar(
        radius: radius, // Adjust the radius as needed
        backgroundColor: Colors.white,
      ),
    );
  }
}
