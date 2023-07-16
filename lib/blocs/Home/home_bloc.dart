import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheraa/blocs/Home/home_bloc.dart';

import 'package:sheraa/models/categories_model.dart';
import 'package:sheraa/repositories/category_repository.dart';
import 'package:sheraa/repositories/file_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository categoryRepository;
  final FileRepository fileRepository;

  HomeBloc(this.categoryRepository, this.fileRepository)
      : super(HomeInitial()) {
    on<InitialHomeEvent>(_fetchHomePageData);
  }

  FutureOr<void> _fetchHomePageData(
      InitialHomeEvent event, Emitter<HomeState> emit) async {
    emit(HomePageLoading());
    final app_logo = await _fetchAppLogo() ?? "wtf";
    print(app_logo);
    final categories = await _fetchCachedCategories();
    // final trending_products = await _fetchTrendingProducts();
    emit(HomePageLoaded(categories, app_logo));
  }

  Future<CategoriesResponse> _fetchCachedCategories() async {
    return await categoryRepository.getCategoryList();
  }

  Future<String?> _fetchAppLogo() async {
    return fileRepository.getAppLogo();
  }
  

  // Future<> _fetchTrendingProducts() async {}
}
