import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sheraa/blocs/Home/home_bloc.dart';
import 'package:sheraa/blocs/category_listing_bloc/bloc/category_listing_bloc_bloc.dart';
import 'package:sheraa/main.config.dart';
// import 'package:sheraa/repositories/category_repository.dart';
// import 'package:sheraa/repositories/file_repository.dart';
// import 'package:sheraa/repositories/subcategory_repository.dart';
import 'package:sheraa/resources/themes.dart';
import 'package:sheraa/screens/app_router.dart';
import 'package:sheraa/screens/home/home_screen.dart';

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
      child: MaterialApp(
        title: 'Sheraa your personal brand',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    ));
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}

// void setupLocator() {
//   GetIt.I.registerSingleton<FileRepository>(FileRepository());
//   GetIt.I.registerSingleton<CategoryRepository>(CategoryRepository());
//   GetIt.I.registerSingleton<SubcategoryRepository>(SubcategoryRepository());
// }
