import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sheraa/dto/product_dto.dart';

class TrendingProduct extends StatefulWidget {
  final ProductDto product;

  const TrendingProduct({super.key, required this.product});

  @override
  State<TrendingProduct> createState() => _TrendingProductState();
}

class _TrendingProductState extends State<TrendingProduct> {
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
              CarouselSlider(
                options: CarouselOptions(
                  height: 180.0, // Adjust the height as desired
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: widget.product.images!.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        // child: Image.asset(
                        //   imagePath,
                        //   fit: BoxFit.cover,
                        // ),
                        child: CachedNetworkImage(
                          imageUrl: imagePath,
                          width: 120,
                          height: 120,
                          placeholder: (context, url) => const SizedBox(
                            width: 120,
                            height: 120,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      );
                    },
                  );
                }).toList(),
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
                      'Discount: ${widget.product.offerText}',
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
