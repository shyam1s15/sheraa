part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();
}

class ProductDetailInitial extends ProductDetailState {
  @override
  List<Object> get props => [];
}

class ProductDetailLoading extends ProductDetailState {
  @override
  List<Object> get props => [];
}

class ProductDetailLoaded extends ProductDetailState {
  final ProductsDto data;
  ProductDetailLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class ProductDetailFailed extends ProductDetailState {
  @override
  List<Object> get props => [];
}