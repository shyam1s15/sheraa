part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomePageLoading extends HomeState {
}

class HomePageLoaded extends HomeState {
  final CategoriesResponse categoryResponse;
  final String app_logo;

  HomePageLoaded(this.categoryResponse, this.app_logo);

  @override
  List<Object> get props => [
        categoryResponse, app_logo
      ];
}
