part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();
  
  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

class HomePageLoadedState extends AppState {
  final List<CategoryDto> categories;
  final List<ProductDto> trendingProductList;
  
  HomePageLoadedState(this.categories, this.trendingProductList);

  @override
  List<Object> get props => [categories];

}

class ProductDetailLoadedState extends AppState {
  final ProductDto product;

  ProductDetailLoadedState(this.product);

  @override
  List<Object> get props => [product];
}

class AppLoadingState extends AppState {

}

class ProductListingPageLoaded extends AppState {
  final CategoryDto category;
  final List<ProductDto> productList;

  ProductListingPageLoaded(this.category, this.productList);

  @override
  List<Object> get props => [category, productList];
}

class CategoryListingBlocMenuLoaded extends AppState {}