import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheraa/blocs/Home/home_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sheraa/blocs/category_listing_bloc/bloc/category_listing_bloc_bloc.dart';
import 'package:sheraa/resources/themes.dart';
import 'package:sheraa/screens/all_cat_subcat_menu/cat_subcat_screen.dart';
import 'package:sheraa/screens/home/category_widget.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APP_BACKGROUND_COLOR,
        elevation: 2,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomePageLoaded) {
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
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomePageLoaded) {
                    return Expanded(
                      child: SizedBox(
                        height: 100,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                child: CategoryWidget(
                                    imageUrl: state.categoryResponse
                                        .categories[index].icon,
                                    name: state.categoryResponse
                                        .categories[index].name),
                                onTap: () {
                                  if (state.categoryResponse.categories[index]
                                          .id ==
                                      "0") {
                                    // load all category subcategory page aka menu
                                    // context.read<CategoryListingBloc>().add(
                                    //     LoadAppMenuEvent(
                                    //         state.categoryResponse));
                                    // Navigator.of(context).push(route)
                                    // CategoryListingBloc()
                                    //   ..add(CategoryListingBlocInitial());
                                    // context
                                    //     .read<HomeBloc>()
                                    //     .navigateToAppMenu(state.categoryResponse);
                                    Navigator.push(
                                        context,
                                        CatSubcatScreen.route(state.categoryResponse)
                                        );
                                  } else {
                                    // load specific category page
                                    context.read<CategoryListingBloc>().add(
                                        LoadCategoryListingPage(
                                            state.categoryResponse,
                                            state.categoryResponse
                                                .categories[index].id));
                                  }
                                },
                              );
                              // return Container();
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount:
                                state.categoryResponse.categories.length),
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
