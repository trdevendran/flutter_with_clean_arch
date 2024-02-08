import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poc/core/ui/widgets/shimmer_circle_avatar.dart';

/// Displays Avatar like a profile pic
class CachedNetworkCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const CachedNetworkCircleAvatar(
      {super.key, required this.imageUrl, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4)),
        child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) =>
                  ShimmerCircleAvatar(radius: radius),
              errorWidget: (context, url, error) => const Icon(Icons.person),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
            )));
  }
}
