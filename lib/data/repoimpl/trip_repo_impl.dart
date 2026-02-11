import 'package:playground_flutter_project/core/base/response_transformer.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/data/datasources/remote/trip_api_services.dart';
import 'package:playground_flutter_project/data/mappers/trip/trips_api_mapper.dart';
import 'package:playground_flutter_project/domain/entities/apientity/trip/trip_api_entity.dart';
import 'package:playground_flutter_project/domain/entities/params/trip/trips_api_params.dart';
import 'package:playground_flutter_project/domain/repositories/trips_repository.dart';

final class TripRepoImpl extends TripsRepository {
  final TripApiServices _tripApiServices;
  final TripsApiMapper _tripsApiMapper;

  TripRepoImpl({
    required TripApiServices tripApiServices,
    required TripsApiMapper tripsApiMapper,
  }) : _tripApiServices = tripApiServices,
       _tripsApiMapper = tripsApiMapper;

  @override
  Future<Result<TripApiEntity>> fetchTrips(TripsApiParams params) async {
    final response = await _tripApiServices.fetchTrips(params);

    return ResponseTransformer().transform(
      response: response,
      mapper: _tripsApiMapper,
    );
  }
}
