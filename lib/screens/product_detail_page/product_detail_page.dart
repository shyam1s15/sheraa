import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheraa/bloc/app_bloc.dart';
import 'package:sheraa/screens/app_common.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key, this.productSlug});
  final String? productSlug;

  static const String routeName = '/product/detail';

  // static Route route(String? productSlug) {
  //   return MaterialPageRoute(
  //       settings: const RouteSettings(name: routeName),
  //       builder: (_) => ProductDetailPage(productSlug: productSlug));
  // }

  @override
  Widget build(BuildContext context) {
    print(productSlug);
    final bloc = BlocProvider.of<AppBloc>(context);
    // Fire the event with the data
    bloc.add(LoadProductDetailPageEvent(productSlug ?? ""));

    return AppLayout(
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is ProductDetailLoadedState) {
            return Stack(
  children: [
    Positioned(
      top: 0, // Set top to 0 to ensure it starts from the top
      left: 0,
      right: 0,
      bottom: 80, // Adjust the bottom value to leave space for the button
      child: ListView(
        children: [
          // Image Carousel covering 60% of the screen
          state.product.images != null &&
                  state.product.images!.isNotEmpty
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                    items: state.product.images!.map((image) {
                      return Image.network(image);
                    }).toList(),
                  ),
                )
              : Container(),
          // Other product details below the carousel
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.product.name ?? "",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                state.product.description != null
                    ? Text(
                        state.product.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200),
                      )
                    : Container(),
                const SizedBox(height: 8),
                state.product.summary != null
                    ? Text(
                        state.product.summary!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200),
                      )
                    : Container(),
                const SizedBox(height: 16),
                Text(
                  state.product.price.toString() + " RS",
                  style: const TextStyle(fontSize: 20),
                ),
                SizedBox(height: 8),
                Text(
                  state.product.offerText.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
                
    ),
    Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Add your action here
                  print('Buy Now');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Red color for button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Curved button
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ],
);
          } else if (state is AppLoadingState) {
            return const Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        strokeWidth: 4,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ));
          } else {
            return Container(
              child: Text(state.toString()),
            );
          }
        },
      ),
    );
  }
}
