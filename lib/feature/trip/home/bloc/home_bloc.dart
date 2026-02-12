import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter_project/domain/entities/params/trip/trips_api_params.dart';
import 'package:playground_flutter_project/domain/usecase/trip/fetch_trips_api_usecase.dart';
import 'package:playground_flutter_project/feature/trip/home/bloc/home_event.dart';
import 'package:playground_flutter_project/feature/trip/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchTripsApiUsecase _fetchTripsApiUsecase;

  HomeBloc({required FetchTripsApiUsecase fetchTripsApiUsecase})
    : _fetchTripsApiUsecase = fetchTripsApiUsecase,
      super(const HomeState()) {
    on<FetchTrips>(_onFetchTrips);
    add(const HomeEvent.fetchTrips(1)); // Initial fetch for page 1
  }

  Future<void> _onFetchTrips(
    FetchTrips event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _fetchTripsApiUsecase.invoke(
      TripsApiParams(page: state.page, limit: 20),
    );

    result.when(
      success: (data) {
        emit(
          state.copyWith(
            movies: [...state.movies, ...data],
            page: state.page + 1,
            isLastPage: data.isEmpty,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(errorMessage: error.toString()));
      },
    );
  }
}
