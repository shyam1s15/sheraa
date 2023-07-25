import 'package:sheraa/dto/listing_page_request_dto.dart';

abstract class ProductService {
  Future<ListingPageRequestDto> getProductList(ListingPageRequestDto dto);
}
