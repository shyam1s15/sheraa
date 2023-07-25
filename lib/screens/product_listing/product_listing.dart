import 'package:flutter/material.dart';
import 'package:sheraa/dto/listing_page_request_dto.dart';

class ProductListingPage extends StatelessWidget {
  final ListingPageRequestDto requestDto;
  
  const ProductListingPage({super.key, required this.requestDto});
  static const String routeName = '/products/listing';

  static Route route(ListingPageRequestDto dto) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductListingPage(requestDto: dto,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
