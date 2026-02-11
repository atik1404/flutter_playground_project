import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/domain/entities/apientity/trip/trip_api_entity.dart';
import 'package:playground_flutter_project/domain/entities/params/trip/trips_api_params.dart';

abstract class TripsRepository {
  Future<Result<TripApiEntity>> fetchTrips(TripsApiParams params);
}
