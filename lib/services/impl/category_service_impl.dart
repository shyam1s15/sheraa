import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sheraa/models/categories_model.dart';
import 'package:sheraa/models/sub_category_model.dart';
import 'package:sheraa/repositories/category_repository.dart';
import 'package:sheraa/repositories/subcategory_repository.dart';
import 'package:sheraa/services/category_service.dart';
import 'package:sheraa/utils/collection_utils.dart';

final GetIt getIt = GetIt.instance;

@Singleton(as: CategoryService)
class CategoryServiceImpl implements CategoryService {
  CategoryRepository categoryRepository = getIt<CategoryRepository>();
  SubcategoryRepository subcategoryRepository = getIt<SubcategoryRepository>();

  @override
  Future<CategoriesResponse> getAppCategoriesWithSubCategories() async {
    CategoriesResponse catResponse = await categoryRepository.getCategoryList();
    
    Map<String, Category> resp = Map();
    if (CollectionUtil.nonNullNonEmpty(catResponse.categories)) {
      // catResponse.categories.map((cat) => resp.putIfAbsent(cat.id, () => cat));
      catResponse.categories.forEach((cat) => resp.putIfAbsent(cat.id, () => cat));
    }
    ListSubcategory subcategories =
        await subcategoryRepository.getSubcategories();

    if (CollectionUtil.nonNullNonEmpty(subcategories.subcategories)) {
      for (var s in subcategories.subcategories) {
        if (resp.containsKey(s.id)) {
          resp[s.id]!.subcategory = s;
        }
      }
    }
    
    catResponse.categories = resp.values.toList();
    return catResponse;
  }
}
