import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheraa/models/categories_model.dart';

part 'category_listing_bloc_event.dart';
part 'category_listing_bloc_state.dart';

class CategoryListingBloc
    extends Bloc<CategoryListingBlocEvent, CategoryListingBlocState> {
  CategoryListingBloc() : super(CategoryListingBlocInitial()) {
    on<CategoryListingBlocEvent>((event, emit) {
    });
    on<LoadAppMenuEvent>(_loadAppMenu);
  }

  FutureOr<void> _loadAppMenu(
      LoadAppMenuEvent event, Emitter<CategoryListingBlocState> emit) {
        // TODO: load data directly from db if not present
    emit(CategoryListingBlocMenuLoaded(event.response));
  }
}
