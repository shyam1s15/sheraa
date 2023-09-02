import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sheraa/bloc/app_bloc.dart';
import 'package:sheraa/resources/themes.dart';
import 'package:sheraa/screens/all_cat_subcat_menu/cat_subcat_screen.dart';
import 'package:sheraa/screens/app_common.dart';
import 'package:sheraa/screens/app_router.dart';
import 'package:sheraa/screens/home/category_widget.dart';
import 'package:sheraa/screens/product_listing/product_listing_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  if (state is HomePageLoadedState) {
                    return Expanded(
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
                                  if (state.categories[index]
                                          .id ==
                                      "0") {
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
                                    Routemaster.of(context).push(ProductListingPage.routeName, queryParameters: {"" : state.trendingProductList[index].productSlug});
                                  }
                                },
                              );
                              // return Container();
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount:
                                state.categories.length),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: Text("Cloud Photos",
                      style: Theme.of(context).textTheme.displayMedium)),
            ],
          )
        ],
      )),
    );
  }
}
