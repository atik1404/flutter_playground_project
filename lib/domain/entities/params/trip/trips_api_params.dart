import 'package:playground_flutter_project/domain/entities/params/api_params_annotation.dart';
part 'trips_api_params.g.dart';

@apiParamsAnnotation
class TripsApiParams {
  final int page;
  final int limit;
  final String? fromSubCityId;
  final String? toSubCityId;
  final String? tripNo;
  final String? busNumber;
  final String? date;

  const TripsApiParams({
    required this.page,
    required this.limit,
    this.fromSubCityId,
    this.toSubCityId,
    this.tripNo,
    this.busNumber,
    this.date,
  });

  Map<String, dynamic> toJson() => _$TripsApiParamsToJson(this);
}
