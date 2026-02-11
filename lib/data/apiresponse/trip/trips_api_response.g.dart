// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripsApiResponse _$TripsApiResponseFromJson(Map<String, dynamic> json) =>
    TripsApiResponse(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : TripInfoResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

TripInfoResponse _$TripInfoResponseFromJson(Map<String, dynamic> json) =>
    TripInfoResponse(
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => TripDocResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocs: (json['totalDocs'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      hasNextPage: json['hasNextPage'] as bool?,
      hasPrevPage: json['hasPrevPage'] as bool?,
      nextPage: (json['nextPage'] as num?)?.toInt(),
      prevPage: (json['prevPage'] as num?)?.toInt(),
      pagingCounter: (json['pagingCounter'] as num?)?.toInt(),
    );

TripDocResponse _$TripDocResponseFromJson(Map<String, dynamic> json) =>
    TripDocResponse(
      id: json['id'] as String?,
      fromSubCity: json['fromSubCity'] == null
          ? null
          : SubCityModel.fromJson(json['fromSubCity'] as Map<String, dynamic>),
      toSubCity: json['toSubCity'] == null
          ? null
          : SubCityModel.fromJson(json['toSubCity'] as Map<String, dynamic>),
      tripHeading: json['tripHeading'] as String?,
      tripNo: json['tripNo'] as String?,
      departureAt: json['departureAt'] as String?,
      arrivalAt: json['arrivalAt'] as String?,
      routeName: json['routeName'] as String?,
      direction: json['direction'] as String?,
      busNumber: json['busNumber'] as String?,
      busType: json['busType'] as String?,
      layoutClass: json['layoutClass'] as String?,
      seatCount: (json['seatCount'] as num?)?.toInt(),
      available: (json['available'] as num?)?.toInt(),
      reserved: json['reserved'] == null
          ? null
          : GenderCountModel.fromJson(json['reserved'] as Map<String, dynamic>),
      sold: json['sold'] == null
          ? null
          : GenderCountModel.fromJson(json['sold'] as Map<String, dynamic>),
      fare: (json['fare'] as List<dynamic>?)
          ?.map((e) => FareModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SubCityModel _$SubCityModelFromJson(Map<String, dynamic> json) =>
    SubCityModel(id: json['id'] as String?, name: json['name'] as String?);

GenderCountModel _$GenderCountModelFromJson(Map<String, dynamic> json) =>
    GenderCountModel(
      male: (json['male'] as num?)?.toInt(),
      female: (json['female'] as num?)?.toInt(),
    );

FareModel _$FareModelFromJson(Map<String, dynamic> json) => FareModel(
  seatClass: json['seatClass'] as String?,
  amount: json['amount'] as num?,
);
