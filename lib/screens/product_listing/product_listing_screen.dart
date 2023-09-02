import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sheraa/bloc/app_bloc.dart';
import 'package:sheraa/resources/commons/app_text.dart';
import 'package:sheraa/screens/app_common.dart';
import 'package:sheraa/screens/app_router.dart';
import 'package:sheraa/screens/product_detail_page/product_detail_page.dart';
import 'package:sheraa/screens/product_listing/product_card.dart';

import '../../resources/themes.dart';

class ProductListingPage extends StatelessWidget {
  final String? category;

  const ProductListingPage({super.key, this.category});
  static const String routeName = '/products/listing';

  // static Route route() {
  //   return MaterialPageRoute(
  //     settings: const RouteSettings(name: routeName),
  //     builder: (_) => ProductListingPage(
  //       requestDto: dto,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Access the BLoC
    final bloc = BlocProvider.of<AppBloc>(context);

    // Fire the event with the data
    bloc.add(LoadProductListingPageEvent(category ?? ""));

    return AppLayout(
      child: SafeArea(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is ProductListingPageLoaded) {
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
                            onPressed: () => Navigator.pop(context),
                            // onPressed: () => context.pop(),
                            icon: const Icon(Icons.arrow_back_ios_rounded)),
                        CachedNetworkImage(
                          imageUrl: state.category
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
                            text: state.category.name ?? ""),
                      ],
                    ),
                  ),
                  state.productList.isNotEmpty
                      ? Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  2, // Number of columns in the grid
                              crossAxisSpacing: 10.0, // Spacing between columns
                              mainAxisSpacing: 10.0, // Spacing between rows
                            ),
                            itemCount: state.productList.length, // Number of items in the grid
                            itemBuilder: (context, index) {
                              return InkWell(
                                //onTap: () => Navigator.pushNamed(context, ProductDetailPage.routeName, arguments: {'id': state.productResponseDto.products![index].id}),
                                // onTap: () => context.pushNamed(ProductDetailPage.routeName, pathParameters: {"id": state.productResponseDto.products![index].id}),
                                onTap: () =>Routemaster.of(context).push(ProductDetailPage.routeName, queryParameters: {"name" : state.productList[index].productSlug}),
                                child: ProductCard(
                                  name: state.productList[index].name ?? "",
                                  imageUrl: state.productList[index].images!.first,
                                  price: state.productList[index].price ?? 0,
                                  discountAmount: 0,
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
