import 'package:playground_flutter_project/data/apiresponse/api_response_annotation.dart';

part 'login_api_response.g.dart';

@apiResponse
class LoginApiResponse {
  final LoginResponse? data;
  final int? statusCode;
  final String? message;

  const LoginApiResponse({this.data, this.statusCode, this.message});

  factory LoginApiResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginApiResponseFromJson(json);
}

@apiResponse
class LoginResponse {
  final String? accessToken;
  final String? expDateTime;

  LoginResponse({this.accessToken, this.expDateTime});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
