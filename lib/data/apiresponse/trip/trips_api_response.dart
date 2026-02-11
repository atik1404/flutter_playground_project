// trips_response_model.dart

import 'package:playground_flutter_project/data/apiresponse/api_response_annotation.dart';

part 'trips_api_response.g.dart';

@apiResponse
class TripsApiResponse {
  final int? statusCode;
  final String? message;
  final TripInfoResponse? data;

  const TripsApiResponse({this.statusCode, this.message, this.data});

  factory TripsApiResponse.fromJson(Map<String, dynamic> json) =>
      _$TripsApiResponseFromJson(json);
}

@apiResponse
class TripInfoResponse {
  final List<TripDocResponse>? docs;
  final int? totalDocs;
  final int? limit;
  final int? page;
  final int? totalPages;
  final bool? hasNextPage;
  final bool? hasPrevPage;
  final int? nextPage;
  final int? prevPage;
  final int? pagingCounter;

  const TripInfoResponse({
    this.docs,
    this.totalDocs,
    this.limit,
    this.page,
    this.totalPages,
    this.hasNextPage,
    this.hasPrevPage,
    this.nextPage,
    this.prevPage,
    this.pagingCounter,
  });

  factory TripInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$TripInfoResponseFromJson(json);
}

@apiResponse
class TripDocResponse {
  final String? id;
  final SubCityModel? fromSubCity;
  final SubCityModel? toSubCity;
  final String? tripHeading;
  final String? tripNo;
  final String? departureAt;
  final String? arrivalAt;
  final String? routeName;
  final String? direction;
  final String? busNumber;
  final String? busType;
  final String? layoutClass;
  final int? seatCount;
  final int? available;
  final GenderCountModel? reserved;
  final GenderCountModel? sold;
  final List<FareModel>? fare;

  const TripDocResponse({
    this.id,
    this.fromSubCity,
    this.toSubCity,
    this.tripHeading,
    this.tripNo,
    this.departureAt,
    this.arrivalAt,
    this.routeName,
    this.direction,
    this.busNumber,
    this.busType,
    this.layoutClass,
    this.seatCount,
    this.available,
    this.reserved,
    this.sold,
    this.fare,
  });

  factory TripDocResponse.fromJson(Map<String, dynamic> json) =>
      _$TripDocResponseFromJson(json);
}

@apiResponse
class SubCityModel {
  final String? id;
  final String? name;

  const SubCityModel({this.id, this.name});

  factory SubCityModel.fromJson(Map<String, dynamic> json) =>
      _$SubCityModelFromJson(json);
}

@apiResponse
class GenderCountModel {
  final int? male;
  final int? female;

  const GenderCountModel({this.male, this.female});

  factory GenderCountModel.fromJson(Map<String, dynamic> json) =>
      _$GenderCountModelFromJson(json);
}

@apiResponse
class FareModel {
  final String? seatClass;
  final num? amount;

  const FareModel({this.seatClass, this.amount});

  factory FareModel.fromJson(Map<String, dynamic> json) =>
      _$FareModelFromJson(json);
}
