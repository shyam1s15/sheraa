import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheraa/blocs/Home/home_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sheraa/resources/themes.dart';

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
                  // return CachedNetworkImage(
                  //   imageUrl:
                  //       state.app_logo, // Replace with your image URL
                  //   width: 34,
                  //   height: 34,
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // );
                  print(state.app_logo);
                  return Image.network(state.app_logo, width: 30, height: 30);
                } else {
                  return Container();
                }
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sheraa',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Text('Your personal brand',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
            // ListTile(
            //   title: const Text('Sheraa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            //   subtitle: const Text('Your personal brand', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            // ),
          ],
        ),
        // leading: Icon(),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // BlocBuilder to handle UI updates
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeInitial) {
                    return ElevatedButton(
                        onPressed: () {
                          // context.read<HomeBloc>().add(HomeEvent());
                        },
                        child: Text("Gallery Photos",
                            style: Theme.of(context).textTheme.displayMedium));
                  } else {
                    return Text("Kam shuru toh kar bhai");
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
