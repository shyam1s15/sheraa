part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
  @override
  List<Object> get props => [];
}

class ProductDetailInitialEvent extends ProductDetailEvent {
  @override
  List<Object> get props => [];
}

class LoadProductDetailEvent extends ProductDetailEvent {
  final String id;

  LoadProductDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
