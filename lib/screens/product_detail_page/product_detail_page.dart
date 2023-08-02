import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.productName});
  final String? productName;

  static const String routeName = '/product/detail';

  static Route route(String? productName) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductDetailPage(productName: productName)
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Scaffold with Bottom Bar'),
      ),
      body: Center(
        child: Text('Product ID: ${productName}'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: _currentIndex,
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
