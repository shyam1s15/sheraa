part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class InitialHomeEvent extends HomeEvent {
  const InitialHomeEvent();
  @override
  List<Object> get props => [];
}
