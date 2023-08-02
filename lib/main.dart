import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:sheraa/blocs/Home/home_bloc.dart';
import 'package:sheraa/blocs/category_listing_bloc/bloc/category_listing_bloc_bloc.dart';
import 'package:sheraa/dto/listing_page_request_dto.dart';
import 'package:sheraa/main.config.dart';
import 'package:sheraa/models/categories_model.dart';
// import 'package:sheraa/repositories/category_repository.dart';
// import 'package:sheraa/repositories/file_repository.dart';
// import 'package:sheraa/repositories/subcategory_repository.dart';
import 'package:sheraa/resources/themes.dart';
import 'package:sheraa/screens/all_cat_subcat_menu/cat_subcat_screen.dart';
import 'package:sheraa/screens/app_router.dart';
import 'package:sheraa/screens/error/error_screen.dart';
import 'package:sheraa/screens/home/home_screen.dart';
import 'package:sheraa/screens/product_detail_page/product_detail_page.dart';
import 'package:sheraa/screens/product_listing/product_listing_screen.dart';

import 'firebase_options.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
  )
void configureDependencies() => getIt.init();

Future<void> main() async {
  
  runZonedGuarded<void>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // setupLocator();
    configureDependencies();

    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()..add(InitialHomeEvent())),
        BlocProvider(create: (_) => CategoryListingBloc()..add(CategoryAppPageInitialEvent())),
      ],
      child: MaterialApp.router(
        title: 'Sheraa your personal brand',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        // routerConfig: AppRouter.router,

        // onGenerateRoute: AppRouter.onGenerateRoute,
        // initialRoute: HomeScreen.routeName,
        // initialRoute: ProductDetailPage.routeName,
      ),
    ));
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}

// void setupLocator() {
//   GetIt.I.registerSingleton<FileRepository>(FileRepository());
//   GetIt.I.registerSingleton<CategoryRepository>(CategoryRepository());
//   GetIt.I.registerSingleton<SubcategoryRepository>(SubcategoryRepository());
// }

// final GoRouter router = GoRouter(
//     initialLocation: HomeScreen.routeName,
  // errorPageBuilder: (context, state) => MaterialPage(
  //   child: Scaffold(
  //     appBar: AppBar(title: Text('Page Not Found')),
  //     body: Center(child: Text('404 - Page Not Found')),
  //   ),
  // ),
