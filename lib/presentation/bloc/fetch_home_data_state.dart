part of 'fetch_home_data_bloc.dart';


abstract class FetchHomeDataState {}

class HomeInitial extends FetchHomeDataState {}

class HomeLoading extends FetchHomeDataState {}

class HomeLoaded extends FetchHomeDataState {
  final HomeDataModel movies;
  HomeLoaded(this.movies);
}

class HomeError extends FetchHomeDataState {
  final String message;
  HomeError(this.message);
}