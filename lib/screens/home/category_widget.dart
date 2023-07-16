import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryWidget extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final String name;

  const CategoryWidget({
    required this.imageUrl,
    this.radius = 40.0,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: CachedNetworkImageProvider(imageUrl),
        ),
        Text(name)
      ],
    );
  }
}
