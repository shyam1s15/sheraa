import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheraa/blocs/Home/home_bloc.dart';

import 'package:sheraa/models/categories_model.dart';
import 'package:sheraa/repositories/category_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository categoryRepository;

  HomeBloc(this.categoryRepository) : super(HomeInitial()) {
    on<InitialHomeEvent>(_fetchHomePageData);
  }

  FutureOr<void> _fetchHomePageData(
      InitialHomeEvent event, Emitter<HomeState> emit) async {
    emit(HomePageLoading());
    final categories = await _fetchCachedCategories();
    // final trending_products = await _fetchTrendingProducts();
    emit(HomePageLoaded(categories));
  }

  Future<CategoriesResponse> _fetchCachedCategories() async {
    categoryRepository.getCategoryStream();
    throw Exception("Break");
  }

  // Future<> _fetchTrendingProducts() async {}
}
