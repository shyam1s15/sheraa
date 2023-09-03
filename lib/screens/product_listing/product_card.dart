import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../dto/product_dto.dart';

/*class ProductCard extends StatelessWidget {
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
      height: 320,
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
}*/


/*class ProductCard extends StatelessWidget {
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
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 160.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Price: \$${price.toStringAsFixed(2)}',
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
    );
  }
}*/


class ProductCard extends StatefulWidget {
  final ProductDto product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                          imageUrl: widget.product.images![0],
                          width: 120,
                          height: 120,
                          placeholder: (context, url) => const SizedBox(
                            width: 120,
                            height: 120,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
              /*CachedNetworkImage(
                imageUrl: widget.product.images,
                width: 120,
                height: 120,
                placeholder: (context, url) => const SizedBox(
                  width: 120,
                  height: 120,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      widget.product.name ?? "",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Price: ${widget.product.price}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${widget.product.offerText}',
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
