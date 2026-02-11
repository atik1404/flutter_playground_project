// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_api_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripsApiParams _$TripsApiParamsFromJson(Map<String, dynamic> json) =>
    TripsApiParams(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      fromSubCityId: json['fromSubCityId'] as String?,
      toSubCityId: json['toSubCityId'] as String?,
      tripNo: json['tripNo'] as String?,
      busNumber: json['busNumber'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$TripsApiParamsToJson(TripsApiParams instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'fromSubCityId': instance.fromSubCityId,
      'toSubCityId': instance.toSubCityId,
      'tripNo': instance.tripNo,
      'busNumber': instance.busNumber,
      'date': instance.date,
    };
