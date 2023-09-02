import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../resources/themes.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  AppLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APP_BACKGROUND_COLOR,
        elevation: 2,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CachedNetworkImage(
                    imageUrl: "https://storage.googleapis.com/sheraa-95d17.appspot.com/sheraa_logo_darkj.jpeg", // Replace with your image URL
                    width: 34,
                    height: 34,
                    placeholder: (context, url) => const SizedBox(
                      width: 34,
                      height: 34,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sheraa',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('Your personal brand',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
          ],
        ),
      ));
  }
}