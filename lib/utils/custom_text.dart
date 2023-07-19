import 'package:flutter/material.dart';

class CustomNormalAppText extends StatelessWidget {
  final String text;
  const CustomNormalAppText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.w200, color: Colors.black));
  }
}
