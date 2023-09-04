import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sheraa/bloc/app_bloc.dart';
import 'package:sheraa/screens/app_common.dart';
import 'package:sheraa/screens/home/home_screen.dart';
import 'package:sheraa/utils/utils.dart';

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
                  bottom:
                      80, // Adjust the bottom value to leave space for the button
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
                              // Show the popup when the button is pressed
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return MyPopupDialog();
                                },
                              );
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

class MyPopupDialog extends StatefulWidget {
  @override
  _MyPopupDialogState createState() => _MyPopupDialogState();
}

class _MyPopupDialogState extends State<MyPopupDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String message = ''; // To display a success message
  bool showNetworkImage =
      false; // To control the visibility of the network image

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text('User Information'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible:
                !showNetworkImage, // Hide input fields when showNetworkImage is true
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required.';
                      }
                      return null; // Validation passed.
                    },
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(labelText: 'Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Address is required.';
                      }
                      return null; // Validation passed.
                    },
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: 'Phone'),
                    validator: (value) {
                      if (value == null || value.isEmpty || !isPhoneNumberValid(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null; // Validation passed.
                    },
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Text(message, style: TextStyle(color: Colors.green)),
          Visibility(
            visible:
                !showNetworkImage, // Hide buttons when showNetworkImage is true
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    // // Save button logic here
                    // String name = nameController.text;
                    // String address = addressController.text;
                    // String phone = phoneController.text;
                  if (_formKey.currentState!.validate()) {
                      setState(() {
                        showNetworkImage = true;
                      });

                      Future.delayed(Duration(seconds: 10), () {
                        Navigator.of(context).pop();
                        Routemaster.of(context).push(
                          HomeScreen.routeName,
                        );
                      });
                    }
                    if (nameController.text.isEmpty) {
                      setState(() {
                        message = '';
                      });
                    }
                  },
                  child: Text('Save'),
                ),
                TextButton(
                  onPressed: () {
                    // Cancel button logic here
                    // Close the dialog without saving
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ),
          Center(
            child: Visibility(
              visible:
                  showNetworkImage, // Show network image when showNetworkImage is true
              child: CachedNetworkImage(
                imageUrl:
                    "https://storage.googleapis.com/sheraa-95d17.appspot.com/order_placed.jpeg",
                width: 200,
                height: 200,
                placeholder: (context, url) => const SizedBox(
                  width: 200,
                  height: 200,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
