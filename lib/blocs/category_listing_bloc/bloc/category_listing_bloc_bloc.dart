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
      // TODO: implement event handler
    });
    on<LoadAppMenuEvent>(_loadAppMenu);
  }

  FutureOr<void> _loadAppMenu(
      LoadAppMenuEvent event, Emitter<CategoryListingBlocState> emit) {
    print("objects loaded");
    emit(CategoryListingBlocMenuLoaded(event.response));
  }
}
