import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheraa/models/categories_model.dart';

part 'category_listing_bloc_event.dart';
part 'category_listing_bloc_state.dart';

class CategoryListingBlocBloc extends Bloc<CategoryListingBlocEvent, CategoryListingBlocState> {
  CategoryListingBlocBloc() : super(CategoryListingBlocInitial()) {
    on<CategoryListingBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
