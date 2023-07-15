import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheraa/blocs/Home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return BlocListener<GalleryBloc, GalleryState>(
        listener: (context, galleryState) {
          // final cloudState = context.read<CloudBloc>().state;
          // if (galleryState is GalleryInitial && cloudState is CloudInitial) {
          //   Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (Route<dynamic> route) => false);
          // }
          print(galleryState.toString());
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("some title"),
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
                  BlocBuilder<GalleryBloc, GalleryState>(
                    builder: (context, state) {
                      if (state is GalleryInitial) {
                        return ElevatedButton(
                            onPressed: () {
                              context.read<GalleryBloc>().add(OpenGalleryEvent());
                            },
                            child: Text("Gallery Photos",
                                style: Theme.of(context).textTheme.displayMedium));
                      } else if (state is GalleryLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is GalleryLoaded) {
                        // Display the loaded images
                        return ElevatedButton(
                            onPressed: () {},
                            child: Text("Gallery Loaded",
                                style: Theme.of(context).textTheme.displayMedium));
                      } else if (state is GalleryError) {
                        return Text('Error occurred: ${state.errorMessage}');
                      } else {
                        return const Text('Unknown state');
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
        ));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("some title"),
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
