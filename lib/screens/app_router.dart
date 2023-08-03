import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheraa/dto/listing_page_request_dto.dart';
import 'package:sheraa/models/categories_model.dart';
import 'package:sheraa/screens/all_cat_subcat_menu/cat_subcat_screen.dart';
import 'package:sheraa/screens/home/home_screen.dart';
import 'package:sheraa/screens/product_detail_page/product_detail_page.dart';
import 'package:sheraa/screens/product_listing/product_listing_screen.dart';

import 'error/error_screen.dart';

/*class AppRouter {
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
      case ProductDetailPage.routeName:
        return ProductDetailPage.route(settings.arguments as String?);
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

  // final router = GoRouter(
  //   routes: [
  //     GoRoute(
  //       path: '/',
  //       pageBuilder: (context, state) => HomeScreen(),
  //     ),
  //     GoRoute(
  //       path: '/catSubcat',
  //       pageBuilder: (context, state) => CatSubcatScreen(response: categoriesResponse: state.params['categoriesResponse'] as CategoriesResponse,
  //
  //       ),
  //     ),
  //     GoRoute(
  //       path: '/productListing',
  //       pageBuilder: (context, state) => ProductListingPage(
  //         listingPageRequest: state.params['listingPageRequest'] as ListingPageRequestDto,
  //       ),
  //     ),
  //     GoRoute(
  //       path: '/productDetail',
  //       pageBuilder: (context, state) => ProductDetailPage(),
  //     ),
  //   ],
  //   errorPageBuilder: (context, state) => ErrorPage(),
  // );
}*/
class AppRouter {
  // static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
      initialLocation: HomeScreen.routeName,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            name: HomeScreen.routeName,
            path: HomeScreen.routeName,
            builder: (context, state) {
              print("/Home");
              return HomeScreen();
            }),
        GoRoute(
            name: CatSubcatScreen.routeName,
            path: CatSubcatScreen.routeName,
            builder: (context, state) {
              return CatSubcatScreen(
                  response: state.extra as CategoriesResponse);
            }),
        GoRoute(
            // path: ProductListingPage.routeName,
            name: ProductListingPage.routeName,
            path: ProductListingPage.routeName,
            builder: (context, state) {
              print("/ProductListingPage");
              return ProductListingPage(
                  requestDto: state.extra as ListingPageRequestDto);
            }),
        GoRoute(
            name: ProductDetailPage.routeName,
            path: "${ProductDetailPage.routeName}/:id",
            builder: (context, state) {
              return ProductDetailPage(
                  id: state.pathParameters["id"]);
            })
      ], errorBuilder: (context, state) => const ErrorPage());

  static GoRouter get router => _router;
}