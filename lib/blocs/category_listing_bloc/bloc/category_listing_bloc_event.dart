part of 'category_listing_bloc_bloc.dart';

abstract class CategoryListingBlocEvent extends Equatable {
  const CategoryListingBlocEvent();

  @override
  List<Object> get props => [];
}

class CategoryAppPageInitialEvent extends CategoryListingBlocEvent {}


class SelectCategoryEvent extends CategoryListingBlocEvent {}

class LoadAppMenuEvent extends CategoryListingBlocEvent {
  final CategoriesResponse response;
  final String selectedCategory = "0";
  final String selectedSubcategory = "0";

  const LoadAppMenuEvent(this.response);

  @override
  List<Object> get props => [response, selectedCategory, selectedSubcategory];
}

class LoadCategoryListingPage extends CategoryListingBlocEvent {
  final String selectedCategory;
  final String selectedSubcategory;

  const LoadCategoryListingPage(this.selectedCategory, this.selectedSubcategory);

  @override
  List<Object> get props => [selectedCategory, selectedSubcategory];
}
