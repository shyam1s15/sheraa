import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheraa/blocs/product_detail/product_detail_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key, required this.id});
  final String? id;

  static const String routeName = '/product/detail';

  static Route route(String? id) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductDetailPage(id: id));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ProductDetailBloc>(context);

    // Fire the event with the data
    bloc.add(LoadProductDetailEvent(id ?? "0"));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Scaffold with Bottom Bar'),
      ),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoaded) {
            return Stack(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      // Image Carousel covering 60% of the screen
                      state.data.images != null  && state.data.images!.isNotEmpty
                      ? Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 3),
                          ),
                          items: [
                            ListView.builder(itemCount: state.data.images!.length ,itemBuilder: (context, index)  {
                            return Image.network(state.data.images![index]);
                          })],

                        ),
                      ) :
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 3),
                          ),
                          items: [
                            // Add your image widgets here
                            Image.network('https://example.com/image1.jpg',
                                fit: BoxFit.cover),
                            Image.network('https://example.com/image2.jpg',
                                fit: BoxFit.cover),
                            Image.network('https://example.com/image3.jpg',
                                fit: BoxFit.cover),
                          ],

                          // items: ListView.builder(itemCount: state.data.images ,itemBuilder: (context, index)),

                        ),
                      ),
                      // Other product details below the carousel
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.data.name,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              state.data.about != null ? Text(
                                state.data.about!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w200),
                              ) : Container(),

                              const SizedBox(height: 8),
                              state.data.moreInfo != null ? Text(
                                state.data.moreInfo!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w200),
                              ) : Container(),
                              // Column(children: [
                              //   // state.data.about != null ?
                              //   // Html(data: state.data.about) : Container(),
                              //   // state.data.moreInfo != null ?
                              //   // Html(data: state.data.moreInfo) : Container(),
                              // ],),
                              const SizedBox(height: 16),
                              Text(
                                state.data.price.toString() + " RS",
                                style: const TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 8),
                              Text(
                                state.data.discount.toString() + " RS OFF",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
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
                                borderRadius: BorderRadius.circular(
                                    30.0), // Curved button
                              ),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                            ),
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          } else if (state is ProductDetailLoading) {
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
            return Container();
          }
        },
      ),
    );
  }
}
