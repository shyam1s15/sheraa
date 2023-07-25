part of 'category_listing_bloc_bloc.dart';

abstract class CategoryListingBlocState extends Equatable {
  const CategoryListingBlocState();

  @override
  List<Object> get props => [];
}

class CategoryListingBlocInitial extends CategoryListingBlocState {}

class CategoryListingBlocMenuLoaded extends CategoryListingBlocState {
  final CategoriesResponse response;
  final String selectedCategory = "0";
  final String selectedSubcategory = "0";

  const CategoryListingBlocMenuLoaded(this.response);

  @override
  List<Object> get props => [response, selectedCategory, selectedSubcategory];
}

class SelectedCategoryListing extends CategoryListingBlocState {
  final CategoriesResponse response;
  final String selectedCategory;
  final String selectedSubcategory;

  const SelectedCategoryListing(this.response, this.selectedCategory, this.selectedSubcategory);
  @override
  List<Object> get props => [response, selectedCategory, selectedSubcategory];
}
