import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:sheraa/dto/products_dto.dart';

import '../../services/product_service.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';


final GetIt getIt = GetIt.instance;
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductService productService = getIt<ProductService>();
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<ProductDetailEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadProductDetailEvent>(_loadProductDetail);
  }

  FutureOr<void> _loadProductDetail(LoadProductDetailEvent event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoading());
    try {
      ProductsDto? dto = await productService.getProductDetail(event.id);
      if (dto == null) {
        emit(ProductDetailFailed());
      }
      emit (ProductDetailLoaded(dto!));
    } catch (e) {
      emit (ProductDetailFailed());
    }
  }
}
