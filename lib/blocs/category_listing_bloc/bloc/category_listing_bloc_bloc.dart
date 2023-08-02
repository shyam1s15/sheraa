import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:sheraa/models/categories_model.dart';
import 'package:sheraa/repositories/file_repository.dart';
import 'package:sheraa/services/category_service.dart';
import 'package:sheraa/services/product_service.dart';
import 'package:sheraa/utils/collection_utils.dart';

import '../../../dto/lisiting_page_response_dto.dart';
import '../../../dto/listing_page_request_dto.dart';

part 'category_listing_bloc_event.dart';
part 'category_listing_bloc_state.dart';
final GetIt getIt = GetIt.instance;

class CategoryListingBloc
    extends Bloc<CategoryListingBlocEvent, CategoryListingBlocState> {

  final ProductService productService = getIt<ProductService>();
  final CategoryService categoryService = getIt<CategoryService>();
  final fileRepository = getIt<FileRepository>();
  CategoryListingBloc() : super(CategoryListingBlocInitial()) {
    on<CategoryListingBlocEvent>((event, emit) {
    });
    on<LoadAppMenuEvent>(_loadAppMenu);
    on<LoadCategoryListingPage> (_loadCategorySubcategoryProductListingPage);
  }

  FutureOr<void> _loadAppMenu(
      LoadAppMenuEvent event, Emitter<CategoryListingBlocState> emit) async {
        // TODO: load data directly from db if not present
    CategoriesResponse response = await categoryService.getAppCategoriesWithSubCategories();
    emit(CategoryListingBlocMenuLoaded(response));
  }

  FutureOr<void> _loadCategorySubcategoryProductListingPage(LoadCategoryListingPage event, Emitter<CategoryListingBlocState> emit) async {
    emit(ProductPageLoadingState());
    try {
      ListingPageResponseDto? resp = await productService.getProductList(
          ListingPageRequestDto(
              event.selectedCategory, event.selectedSubcategory));
      // final category =  await categoryService.getSelectedCategoryWithSubCategory(event.selectedSubcategory);

      if (resp == null || resp.category == null) {
        emit(ErrorState("something went wrong"));
      }

      final String? appLogo = await fileRepository.getAppLogo();

      emit(ProductLoadedState(resp!, appLogo ?? ""));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
