import 'package:playground_flutter_project/core/base/base_use_case.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/domain/entities/apientity/trip/trip_api_entity.dart';
import 'package:playground_flutter_project/domain/entities/params/trip/trips_api_params.dart';
import 'package:playground_flutter_project/domain/repositories/trips_repository.dart';

final class FetchTripsApiUsecase
    implements ApiUseCase<TripsApiParams, List<TripApiEntity>> {
  final TripsRepository _repository;

  const FetchTripsApiUsecase(this._repository);

  @override
  Future<Result<List<TripApiEntity>>> invoke(TripsApiParams params) async {
    final result = await _repository.fetchTrips(params);

    return result;
  }
}
