import 'package:playground_flutter_project/core/base/base_mapper.dart';
import 'package:playground_flutter_project/data/apiresponse/trip/trips_api_response.dart';
import 'package:playground_flutter_project/domain/entities/apientity/trip/trip_api_entity.dart';

class TripsApiMapper extends BaseMapper<TripsApiResponse, List<TripApiEntity>> {
  @override
  List<TripApiEntity> map(TripsApiResponse response) {
    final docs = response.data?.docs;
    if (docs == null) return [];

    return docs.map((trip) {
      return TripApiEntity(
        tripId: trip.id ?? "",
        tripHeading: trip.tripHeading ?? "",
        tripNo: trip.tripNo ?? "",
        departureTime: trip.departureAt ?? "",
        arrivalTime: trip.arrivalAt ?? "",
        routeName: trip.routeName ?? "",
        direction: trip.direction ?? "",
        busNumber: trip.busNumber ?? "",
        busType: trip.busType ?? "",
        seatCount: trip.seatCount?.toString() ?? "",
        totalReservedMale: trip.reserved?.male ?? 0,
        totalReservedFemale: trip.reserved?.female ?? 0,
        totalSoldMale: trip.sold?.male ?? 0,
        totalSoldFemale: trip.sold?.female ?? 0,
        amount:
            trip.fare?.map((fare) => fare.amount?.toInt() ?? 0).toList() ?? [],
      );
    }).toList();
  }
}
