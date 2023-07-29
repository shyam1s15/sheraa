import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sheraa/blocs/exceptions/validation_exception.dart';
import 'package:sheraa/dto/lisiting_page_response_dto.dart';
import 'package:sheraa/dto/listing_page_request_dto.dart';
import 'package:sheraa/dto/products_dto.dart';
import 'package:sheraa/models/categories_model.dart';
import 'package:sheraa/repositories/product_respository.dart';
import 'package:sheraa/services/category_service.dart';

import '../product_service.dart';

final GetIt getIt = GetIt.instance;

@Injectable(as: ProductService)
class ProductServiceImpl implements ProductService{
  CategoryService categoryService = getIt<CategoryService>();
  ProductRepository productRepository = getIt<ProductRepository>();

  @override
  Future<ListingPageResponseDto?> getProductList(ListingPageRequestDto dto) async {
    // categoryService.getAppCategoriesWithSubCategories();
    Category? cat = await categoryService.getSelectedCategoryWithSubCategory(dto.selectedCategoryId);
    if (cat == null) {
      throw ValidationException("Category not found");
    }
    List<ProductsDto>? products = await productRepository.getProducts(dto.selectedCategoryId, dto.selectedSubcatId);
    return ListingPageResponseDto(category: cat, products: products);
  }

}