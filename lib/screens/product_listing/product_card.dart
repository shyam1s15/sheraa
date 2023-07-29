import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int price;
  final int discountAmount;

  ProductCard({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.discountAmount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            CachedNetworkImage(
            imageUrl: imageUrl,
            width: 120,
            height: 120,
            placeholder: (context, url) => const SizedBox(
              width: 120,
              height: 120,
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Price: \$${price}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Discount: \$${discountAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
