part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class InitialAppEvent extends AppEvent {

}

//class LoadAppHomePageEvent extends AppEvent {}

class LoadAppCategoriePageEvent extends AppEvent {}

class LoadProductListingPageEvent extends AppEvent {
  final String categoryId;

  LoadProductListingPageEvent(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class LoadProductDetailPageEvent extends AppEvent {
  final String productSlug;

  LoadProductDetailPageEvent(this.productSlug);
  @override
  List<Object> get props => [productSlug];
}

class LoadUserDetailCollectPageEvent extends AppEvent {
  final String productSlug;

  LoadUserDetailCollectPageEvent(this.productSlug);

  @override
  List<Object> get props => [productSlug];
}

class LoadOrderConfirmedScreenPageEvent extends AppEvent {}
