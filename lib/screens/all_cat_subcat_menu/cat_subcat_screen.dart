import 'package:flutter/material.dart';

import '../../resources/themes.dart';

class CatSubcatScreen extends StatelessWidget {
  const CatSubcatScreen({super.key});

  static const String routeName = '/';

  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CatSubcatScreen());
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

    );
  }
}
