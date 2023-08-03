part of 'product_lisiting_bloc.dart';

abstract class ProductLisitingEvent extends Equatable {
  const ProductLisitingEvent();

  @override
  List<Object> get props => [];
}

class ProductListingInitialEvent extends ProductLisitingEvent {
  @override
  List<Object> get props => [];
}

class LoadProductListingEvent extends ProductLisitingEvent {
  final ListingPageRequestDto requestDto;

  LoadProductListingEvent(this.requestDto);

  @override
  List<Object> get props => [requestDto];
}
