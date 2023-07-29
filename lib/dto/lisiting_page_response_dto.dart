import 'package:sheraa/dto/products_dto.dart';
import 'package:sheraa/models/categories_model.dart';

class ListingPageResponseDto {
  Category category;
  List<ProductsDto>? products;

  ListingPageResponseDto({required this.category, required this.products});
}
