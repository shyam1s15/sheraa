import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sheraa/resources/themes.dart';
import 'package:sheraa/screens/app_router.dart';
// import 'package:sheraa/repositories/category_repository.dart';
// import 'package:sheraa/repositories/file_repository.dart';
// import 'package:sheraa/repositories/subcategory_repository.dart';

import 'bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// final getIt = GetIt.instance;

// @InjectableInit(
//   initializerName: 'init', // default
//   preferRelativeImports: true, // default
//   asExtension: true, // default
//   )
// void configureDependencies() => GetIt.asNewInstance();

Future<void> main() async {  
  /*runZonedGuarded<void>(() async {*/
    WidgetsFlutterBinding.ensureInitialized();
    // configureDependencies();
    Bloc.observer = MyBlocObserver(); // Set the custom observer

    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) { 
            print("close your eyes");
            return AppBloc()..add(InitialAppEvent());
          },
        ),
      ],
      child: MaterialApp.router(
        title: 'Sheraa your personal brand',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
        routeInformationParser: RoutemasterParser(),
      ),
    ));

    // runApp(BlocProvider(
    //   create: (context) {
    //     print("AppBloc created");
    //     return AppBloc()..add(InitialAppEvent());
    //   },
    //   child: MaterialApp.router(
    //     title: 'Sheraa your personal brand',
    //     theme: theme(),
    //     debugShowCheckedModeBanner: false,
    //     routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
    //     routeInformationParser: RoutemasterParser(),
    //   ),
    // ));
    
  }
  /*, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}*/

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     BlocProvider(
//       lazy: false,
//       create: (_) {
//         print("AppBloc created");
//         return AppBloc()..add(InitialAppEvent());
//       },
//       child: MaterialApp.router(
//         title: 'Sheraa your personal brand',
//         theme: theme(),
//         debugShowCheckedModeBanner: false,
//         routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
//         routeInformationParser: RoutemasterParser(),
//       ),
//     ),
//   );
// }

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


class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }
}