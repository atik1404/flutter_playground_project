import 'package:playground_flutter_project/core/network/network_client.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/data/apiresponse/trip/trips_api_response.dart';
import 'package:playground_flutter_project/domain/entities/params/trip/trips_api_params.dart';

class TripApiServices {
  final NetworkClient client;

  TripApiServices({required this.client});

  Future<Result<TripsApiResponse>> fetchTrips(TripsApiParams params) {
    return client.get(
      "api/v1/trip",
      queryParameters: params.toJson(),
      parseJson: (json) => TripsApiResponse.fromJson(json),
    );
  }
}
