part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomePageLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomePageLoaded extends HomeState {
  final CategoriesResponse response;
  
  HomePageLoaded(this.response);

  @override
  List<Object> get props => [];
}
