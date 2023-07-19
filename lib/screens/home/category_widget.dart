import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sheraa/utils/custom_text.dart';

class CategoryWidget extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final String name;

  const CategoryWidget({
    required this.imageUrl,
    this.radius = 25.0,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
          const SizedBox(height: 5,),
          CustomNormalAppText(text: name)
        ],
      ),
    );
  }
}
