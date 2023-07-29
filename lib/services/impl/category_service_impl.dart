import 'package:basic_utils/basic_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sheraa/models/categories_model.dart';
import 'package:sheraa/models/sub_category_model.dart';
import 'package:sheraa/repositories/category_repository.dart';
import 'package:sheraa/repositories/subcategory_repository.dart';
import 'package:sheraa/services/category_service.dart';
import 'package:sheraa/services/product_service.dart';
import 'package:sheraa/utils/collection_utils.dart';

final GetIt getIt = GetIt.instance;

@Injectable(as: CategoryService)
class CategoryServiceImpl implements CategoryService {
  CategoryRepository categoryRepository = getIt<CategoryRepository>();
  SubcategoryRepository subcategoryRepository = getIt<SubcategoryRepository>();

  @override
  Future<CategoriesResponse> getAppCategoriesWithSubCategories() async {
    CategoriesResponse catResponse = await categoryRepository.getCategoryList();

    Map<String, Category> resp = Map();
    if (CollectionUtil.nonNullNonEmpty(catResponse.categories)) {
      // catResponse.categories.map((cat) => resp.putIfAbsent(cat.id, () => cat));
      catResponse.categories
          .forEach((cat) => resp.putIfAbsent(cat.id, () => cat));
    }
    ListSubcategory subcategories =
        await subcategoryRepository.getSubcategories();

    if (CollectionUtil.nonNullNonEmpty(subcategories.subcategories)) {
      for (var s in subcategories.subcategories) {
        if (resp.containsKey(s.category)) {
          if (resp[s.category]!.subcategories == null) {
            resp[s.category]!.subcategories =
                ListSubcategory(subcategories: [s]);
          } else {
            resp[s.category]!.subcategories?.subcategories.add(s);
          }
        }
      }
    }

    catResponse.categories = resp.values.toList();
    return catResponse;
  }

  @override
  Future<Category?> getSelectedCategoryWithSubCategory(String categoryId) async {
    if (StringUtils.isNullOrEmpty(categoryId) || categoryId == "0") {
      return null;
    }
    Category cat = await categoryRepository.findByCategoryId(categoryId);
    ListSubcategory? subcategories = await subcategoryRepository.findByCategory(categoryId);

    if (subcategories != null && CollectionUtil.nonNullNonEmpty(subcategories.subcategories)) {
      cat.subcategories = subcategories;
    }

    return cat;
  }
}
