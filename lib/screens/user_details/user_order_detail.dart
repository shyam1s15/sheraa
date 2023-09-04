import 'package:flutter/material.dart';
import 'package:sheraa/screens/app_common.dart';

class OrderFillDetails extends StatelessWidget {
  const OrderFillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(child: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // To make children fill the width
          
    ),));
  }
}