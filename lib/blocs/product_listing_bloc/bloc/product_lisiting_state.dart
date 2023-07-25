part of 'product_lisiting_bloc.dart';

abstract class ProductLisitingState extends Equatable {
  const ProductLisitingState();

  @override
  List<Object> get props => [];
}

class ProductLisitingInitial extends ProductLisitingState {}

class ProductListingLoaded extends ProductLisitingState {
  final Category category;

  ProductListingLoaded(this.category);
  
  @override
  List<Object> get props => [category];
}
