import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheraa/blocs/category_listing_bloc/bloc/category_listing_bloc_bloc.dart';

import '../../models/categories_model.dart';
import '../../resources/themes.dart';

class CatSubcatScreen extends StatefulWidget {
  CategoriesResponse response;

  CatSubcatScreen({Key? key, required this.response}) : super(key: key);

  static const String routeName = '/cat_sub_screen';

  static Route route(CategoriesResponse args) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatSubcatScreen(response: args),
    );
  }

  @override
  State<CatSubcatScreen> createState() => _CatSubcatScreenState();
}

class _CatSubcatScreenState extends State<CatSubcatScreen> {
  late CategoryListingBloc bloc;

  @override
  void initState() {
    super.initState();
    print("Hii");
    bloc = CategoryListingBloc();
    bloc.add(LoadAppMenuEvent(
        widget.response)); // Fire the initial event for your BLoC
  }

  @override
  void dispose() {
    bloc.close(); // Dispose of BlocB properly to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APP_BACKGROUND_COLOR,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("somewhere"),
      ),
      body: SafeArea(
          child: BlocBuilder<CategoryListingBloc, CategoryListingBlocState>(
        builder: (context, state) {
          if (state is CategoryListingBlocInitial) {
            context
                .read<CategoryListingBloc>()
                .add(LoadAppMenuEvent(widget.response));
            return CircularProgressIndicator();
          } else if (state is CategoryListingBlocMenuLoaded) {
            print("object is already loaded");
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Text(state.response.categories[index].name)
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CachedNetworkImage(
                            imageUrl: state.response.categories[index]
                                .icon, // Replace with your image URL
                            width: 200,
                            height: 200,
                            placeholder: (context, url) => const SizedBox(
                              width: 200,
                              height: 200,
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: state.response.categories.length);
          } else if (state is SelectedCategoryListing) {
            throw UnimplementedError();
          } else {
            throw UnimplementedError();
          }
        },
      )),
    );
  }
}
