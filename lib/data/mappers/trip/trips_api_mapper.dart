import 'package:playground_flutter_project/core/base/base_mapper.dart';
import 'package:playground_flutter_project/data/apiresponse/trip/trips_api_response.dart';
import 'package:playground_flutter_project/domain/entities/apientity/trip/trip_api_entity.dart';

class TripsApiMapper extends BaseMapper<TripDocResponse, TripApiEntity> {
  @override
  TripApiEntity map(TripDocResponse response) {
    return TripApiEntity(
      tripId: response.id ?? "",
      tripHeading: response.tripHeading ?? "",
      tripNo: response.tripNo ?? "",
      departureTime: response.departureAt ?? "",
      arrivalTime: response.arrivalAt ?? "",
      routeName: response.routeName ?? "",
      direction: response.direction ?? "",
      busNumber: response.busNumber ?? "",
      busType: response.busType ?? "",
      seatCount: response.seatCount?.toString() ?? "",
      totalReservedMale: response.reserved?.male ?? 0,
      totalReservedFemale: response.reserved?.female ?? 0,
      totalSoldMale: response.sold?.male ?? 0,
      totalSoldFemale: response.sold?.female ?? 0,
      amount:
          response.fare?.map((fare) => fare.amount?.toInt() ?? 0).toList() ??
          [],
    );
  }
}
