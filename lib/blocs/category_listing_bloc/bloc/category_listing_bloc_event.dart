part of 'category_listing_bloc_bloc.dart';

abstract class CategoryListingBlocEvent extends Equatable {
  const CategoryListingBlocEvent();

  @override
  List<Object> get props => [];
}

class SelectCategoryEvent extends CategoryListingBlocEvent {}

class LoadAppMenuEvent extends CategoryListingBlocEvent {}

class LoadCategorySubCategoryListingPage extends CategoryListingBlocEvent {}
