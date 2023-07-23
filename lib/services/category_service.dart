import 'package:sheraa/models/categories_model.dart';

abstract class CategoryService {
  Future<CategoriesResponse> getAppCategoriesWithSubCategories();
}
