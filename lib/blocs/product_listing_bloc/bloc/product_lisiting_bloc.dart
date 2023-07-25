import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheraa/models/categories_model.dart';

import '../../../dto/listing_page_request_dto.dart';

part 'product_lisiting_event.dart';
part 'product_lisiting_state.dart';

class ProductLisitingBloc
    extends Bloc<ProductLisitingEvent, ProductLisitingState> {
  ProductLisitingBloc() : super(ProductLisitingInitial()) {
    on<ProductLisitingEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadProductListingEvent>(_loadCatSubCatFilteredProducts);
  }

  FutureOr<void> _loadCatSubCatFilteredProducts(LoadProductListingEvent event, Emitter<ProductLisitingState> emit) {
    
  }
}
