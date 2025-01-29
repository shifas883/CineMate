import 'package:bloc/bloc.dart';
import 'package:cinemate/data/model/home_models.dart';
import 'package:cinemate/data/repository/repository.dart';

part 'fetch_home_data_event.dart';
part 'fetch_home_data_state.dart';

class FetchHomeDataBloc extends Bloc<FetchHomeDataEvent, FetchHomeDataState> {
  final HomeRepository homeRepository;

  FetchHomeDataBloc(this.homeRepository) : super(HomeInitial()) {
    on<FetchHomeData>((event, emit) async {
      emit(HomeLoading());
      try {
        final movies = await homeRepository.getHomeData();
        emit(HomeLoaded(movies));
      } catch (e) {
        emit(HomeError('Failed to fetch movies'));
      }
    });
  }
}
