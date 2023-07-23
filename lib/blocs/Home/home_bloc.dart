import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:sheraa/blocs/Home/home_bloc.dart';

import 'package:sheraa/models/categories_model.dart';
import 'package:sheraa/repositories/category_repository.dart';
import 'package:sheraa/repositories/file_repository.dart';

import '../../repositories/subcategory_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

final GetIt getIt = GetIt.instance;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository categoryRepository = getIt<CategoryRepository>();
  final FileRepository fileRepository = getIt<FileRepository>();
  final SubcategoryRepository subcategoryRepository =
      getIt<SubcategoryRepository>();

  HomeBloc()
      : super(HomeInitial()) {
    on<InitialHomeEvent>(_fetchHomePageData);
  }

  FutureOr<void> _fetchHomePageData(
      InitialHomeEvent event, Emitter<HomeState> emit) async {
    emit(HomePageLoading());
    final app_logo = await _fetchAppLogo() ?? "wtf";
    final categories = await _fetchCachedCategories();
    // final trending_products = await _fetchTrendingProducts();
    emit(HomePageLoaded(categories, app_logo));
  }

  Future<CategoriesResponse> _fetchCachedCategories() async {
    subcategoryRepository.getCategoryList();
    return await categoryRepository.getCategoryList();
    
  }

  Future<String?> _fetchAppLogo() async {
    return fileRepository.getAppLogo();
  }
  

  // Future<> _fetchTrendingProducts() async {}
}
