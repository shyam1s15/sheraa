import 'package:sheraa/dto/lisiting_page_response_dto.dart';
import 'package:sheraa/dto/listing_page_request_dto.dart';

import '../dto/products_dto.dart';

abstract class ProductService {
  Future<ListingPageResponseDto?> getProductList(ListingPageRequestDto dto);
  Future<ProductsDto?> getProductDetail(String? id);

}
