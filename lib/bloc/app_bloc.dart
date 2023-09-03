import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:sheraa/api/base_api.dart';
import 'package:sheraa/api/categories_api.dart';
import 'package:sheraa/api/obtained_response.dart';
import 'package:sheraa/api/products_api.dart';
import 'package:sheraa/dto/category_dto.dart';
import 'package:sheraa/dto/product_dto.dart';
import 'package:bloc/bloc.dart';

part 'app_event.dart';
part 'app_state.dart';


class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      
      // TODO: implement event handler
    });
  
    // on<InitialAppEvent> (_loadHomePageData);
    on<LoadAppHomePageEvent> (_loadHomePageData);
    on<LoadAppCategoriePageEvent> (_loadAppCategoriesInfo);
    on<LoadProductListingPageEvent>(_loadProductListingPage);   
    on<LoadProductDetailPageEvent>(_loadProductPageDetail);
    on<LoadUserDetailCollectPageEvent>(_loadUserDetailCollectPageEvent);
    on<LoadOrderConfirmedScreenPageEvent> (_loadOrderConfirmationPage);

  }


  FutureOr<void> _loadHomePageData(LoadAppHomePageEvent event, Emitter<AppState> emit) async {
    CategoriesApi categoriesApi = CategoriesApi();
    ObtainedResponse catResp = await categoriesApi.getCategoriesDetailList();
    if (catResp.result == API_RESULT.FAILED) {
      print(catResp.data ?? "got null");
      emit(AppErrorState(catResp.data as String));
      return;
    }
    ProductCmsApi productCmsApi = ProductCmsApi();
    ObtainedResponse productResp = await productCmsApi.getTrendingProducts();
    if (productResp.result == API_RESULT.FAILED) {
      print(productResp.data);
      emit(AppErrorState(productResp.data as String));
      return;
    } 
    print("hii");
    emit(HomePageLoadedState(catResp.data as List<CategoryDto>, productResp.data as List<ProductDto>));
  }

  FutureOr<void> _loadAppCategoriesInfo(LoadAppCategoriePageEvent event, Emitter<AppState> emit) async {
    CategoriesApi categoriesApi = CategoriesApi();
    ObtainedResponse catResp = await categoriesApi.getCategoriesDetailList();
    if (catResp.result == API_RESULT.FAILED) {
      emit(AppErrorState(catResp.data as String));
      return;
    }

    emit(CategoryListingBlocMenuLoaded(catResp.data as List<CategoryDto>));
  }

  FutureOr<void> _loadProductListingPage(LoadProductListingPageEvent event, Emitter<AppState> emit) async {
    CategoriesApi categoriesApi = CategoriesApi();
    ObtainedResponse catResp = await categoriesApi.getCategoriesDetailList();
    if (catResp.result == API_RESULT.FAILED) {
      emit(AppErrorState(catResp.data as String));
      return;
    }

    ProductCmsApi productCmsApi = ProductCmsApi();
    ObtainedResponse productResp = await productCmsApi.getCategoryWiseProducts(event.categoryId);
    if (productResp.result == API_RESULT.FAILED) {
      emit(AppErrorState(productResp.data as String));
      return;
    } 
    emit(ProductListingPageLoaded(catResp.data as List<CategoryDto>, productResp.data as List<ProductDto>));
  }

  FutureOr<void> _loadProductPageDetail(LoadProductDetailPageEvent event, Emitter<AppState> emit) async {
    ProductCmsApi productCmsApi = ProductCmsApi();
    ObtainedResponse productResp = await productCmsApi.getProductDetailBySlug(event.productSlug);
    if (productResp.result == API_RESULT.FAILED) {
      emit(AppErrorState(productResp.data as String));
      return;
    } 
    emit(ProductDetailLoadedState(productResp.data as ProductDto));
  }

  FutureOr<void> _loadUserDetailCollectPageEvent(LoadUserDetailCollectPageEvent event, Emitter<AppState> emit) {
  }

  FutureOr<void> _loadOrderConfirmationPage(LoadOrderConfirmedScreenPageEvent event, Emitter<AppState> emit) {
  }
}
