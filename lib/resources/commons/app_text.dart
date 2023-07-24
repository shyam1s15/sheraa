import 'package:flutter/material.dart';

class AppTextLarge extends StatelessWidget {
  final String text;
  const AppTextLarge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class AppTextMedium extends StatelessWidget {
  final String text;
  const AppTextMedium({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
class AppTextSmall extends StatelessWidget {
  final String text;
  const AppTextSmall({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
class AppTextDisplayLarge extends StatelessWidget {
  final String text;
  const AppTextDisplayLarge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
class AppTextDisplayMedium extends StatelessWidget {
  final String text;
  const AppTextDisplayMedium({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
class AppTextDisplaySmall extends StatelessWidget {
  final String text;
  const AppTextDisplaySmall({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}

