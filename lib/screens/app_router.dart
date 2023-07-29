import 'package:flutter/material.dart';
import 'package:sheraa/dto/listing_page_request_dto.dart';
import 'package:sheraa/models/categories_model.dart';
import 'package:sheraa/screens/all_cat_subcat_menu/cat_subcat_screen.dart';
import 'package:sheraa/screens/home/home_screen.dart';
import 'package:sheraa/screens/product_listing/product_listing_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CatSubcatScreen.routeName:
        return CatSubcatScreen.route(settings.arguments as CategoriesResponse);
      case ProductListingPage.routeName:
        return ProductListingPage.route(
            settings.arguments as ListingPageRequestDto);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
