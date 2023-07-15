
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'home_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<InitialHomeEvent>((InitialHomeEvent event, emit) {
      // TODO: implement event handler
    });
  }
}
