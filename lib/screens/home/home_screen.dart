import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sheraa/bloc/app_bloc.dart';
import 'package:sheraa/components/trending_product.dart';
// import 'package:sheraa/resources/themes.dart';
// import 'package:sheraa/screens/all_cat_subcat_menu/cat_subcat_screen.dart';
import 'package:sheraa/screens/app_common.dart';
// import 'package:sheraa/screens/app_router.dart';
import 'package:sheraa/screens/home/category_widget.dart';
import 'package:sheraa/screens/product_listing/product_listing_screen.dart';

import '../product_detail_page/product_detail_page.dart';
import '../product_listing/product_card.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/trending';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AppBloc>(context);
    bloc.add(LoadAppHomePageEvent());

    return AppLayout(child: SafeArea(
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is HomePageLoadedState) {
        return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 110,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              child: CategoryWidget(
                                  imageUrl: state.categories[index].icon,
                                  name: state.categories[index].name ?? ""),
                              onTap: () {
                                if (state.categories[index].id == "0") {
                                  // load all category subcategory page aka menu
                                  // Navigator.pushNamed(
                                  //     context, CatSubcatScreen.routeName,
                                  //     arguments: state.categoryResponse);
                                  // context.push(CatSubcatScreen.routeName, extra: state.categoryResponse, );
                                  // Routemaster.of(context).push(CatSubcatScreen.routeName);
                                } else {
                                  // load specific category page
                                  // Navigator.pushNamed(
                                  //     context, ProductListingPage.routeName,
                                  //     arguments: CustomConverter
                                  //         .convert_cat_subcat_to_dto(
                                  //             state.categoryResponse
                                  //                 .categories[index].id,
                                  //             null));
                                  // context.push(ProductListingPage.routeName,
                                  //     extra: CustomConverter.convert_cat_subcat_to_dto(state.categoryResponse.categories[index].id, null));
                                  Routemaster.of(context).push(
                                      ProductListingPage.routeName,
                                      queryParameters: {
                                        "category": state.trendingProductList[index]
                                            .categoryName!
                                      });
                                }
                              },
                            );
                            // return Container();
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemCount: state.categories.length),
                    ),
                  )
                ],
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: state.trendingProductList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        //onTap: () => Navigator.pushNamed(context, ProductDetailPage.routeName, arguments: {'id': state.productResponseDto.products![index].id}),
                        // onTap: () => context.pushNamed(ProductDetailPage.routeName, pathParameters: {"id": state.productResponseDto.products![index].id}),
                        onTap: () => Routemaster.of(context)
                            .push(ProductDetailPage.routeName, queryParameters: {
                          "name": state.trendingProductList[index].productSlug
                        }),
                        /*child: ProductCard(
                          name: state.trendingProductList[index].name ?? "",
                          imageUrl:
                              state.trendingProductList[index].images!.first,
                          price: state.trendingProductList[index].price ?? 0,
                          discountAmount: 0,
                        ),*/
                        child: TrendingProduct(product: state.trendingProductList[index]),
                      );
                    }),
              )
            ]);
      } else {
        return Container();
      }
    })));
  }
}
