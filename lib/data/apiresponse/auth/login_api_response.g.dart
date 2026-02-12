// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginApiResponse _$LoginApiResponseFromJson(Map<String, dynamic> json) =>
    LoginApiResponse(
      accessToken: json['accessToken'] as String?,
      expDateTime: json['expDateTime'] as String?,
    );

Map<String, dynamic> _$LoginApiResponseToJson(LoginApiResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expDateTime': instance.expDateTime,
    };
