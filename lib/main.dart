import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheraa/blocs/Home/home_bloc.dart';
import 'package:sheraa/resources/themes.dart';
import 'package:sheraa/screens/app_router.dart';
import 'package:sheraa/screens/home/home_screen.dart';

import 'firebase_options.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(    
    options: DefaultFirebaseOptions.currentPlatform,
);

  runZonedGuarded<void>(() async {
    runApp(
     MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()..add(InitialHomeEvent()))
      ],
      child: MaterialApp(
        title: 'Sheraa your personal brand',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    ));

  },  (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
