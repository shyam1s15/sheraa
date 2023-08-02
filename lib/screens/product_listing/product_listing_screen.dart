import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sheraa/dto/listing_page_request_dto.dart';
import 'package:sheraa/resources/commons/app_text.dart';
import 'package:sheraa/screens/app_router.dart';
import 'package:sheraa/screens/product_detail_page/product_detail_page.dart';
import 'package:sheraa/screens/product_listing/product_card.dart';

import '../../blocs/category_listing_bloc/bloc/category_listing_bloc_bloc.dart';
import '../../resources/themes.dart';

class ProductListingPage extends StatelessWidget {
  final ListingPageRequestDto requestDto;

  const ProductListingPage({super.key, required this.requestDto});
  static const String routeName = '/products/listing';

  static Route route(ListingPageRequestDto dto) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductListingPage(
        requestDto: dto,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access the BLoC
    final bloc = BlocProvider.of<CategoryListingBloc>(context);

    // Fire the event with the data
    bloc.add(LoadCategoryListingPage(
        requestDto.selectedCategoryId, requestDto.selectedSubcatId ?? "0"));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: APP_BACKGROUND_COLOR,
        elevation: 2,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<CategoryListingBloc, CategoryListingBlocState>(
              builder: (context, state) {
                if (state is ProductLoadedState) {
                  return CachedNetworkImage(
                    imageUrl: state.app_logo, // Replace with your image URL
                    width: 34,
                    height: 34,
                    placeholder: (context, url) => const SizedBox(
                      width: 34,
                      height: 34,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  );
                } else {
                  return const SizedBox(width: 34, height: 34);
                }
              },
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sheraa',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('Your personal brand',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<CategoryListingBloc, CategoryListingBlocState>(
          builder: (context, state) {
            if (state is ProductLoadedState) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            // onPressed: () => Navigator.pop(context),
                            onPressed: () => context.pop(),
                            icon: const Icon(Icons.arrow_back_ios_rounded)),
                        CachedNetworkImage(
                          imageUrl: state.productResponseDto.category
                              .icon, // Replace with your image URL
                          width: 54,
                          height: 54,
                          placeholder: (context, url) => const SizedBox(
                            width: 54,
                            height: 54,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        const SizedBox(width: 10),
                        AppTextDisplaySmall(
                            text: state.productResponseDto.category.name),
                      ],
                    ),
                  ),
                  state.productResponseDto.products != null
                      ? Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  2, // Number of columns in the grid
                              crossAxisSpacing: 10.0, // Spacing between columns
                              mainAxisSpacing: 10.0, // Spacing between rows
                            ),
                            itemCount: state.productResponseDto.products!.length, // Number of items in the grid
                            itemBuilder: (context, index) {
                              return InkWell(
                                //onTap: () => Navigator.pushNamed(context, ProductDetailPage.routeName, arguments: {'id': state.productResponseDto.products![index].id}),
                                onTap: () => context.pushNamed(ProductDetailPage.routeName, pathParameters: {"id": state.productResponseDto.products![index].id}),
                                child: ProductCard(
                                  name: state
                                      .productResponseDto.products![index].name,
                                  imageUrl: state
                                      .productResponseDto.products![index].icon,
                                  price: state
                                      .productResponseDto.products![index].price,
                                  discountAmount: state.productResponseDto
                                      .products![index].discount,
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
