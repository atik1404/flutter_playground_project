import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginApiResponse {
  final String? accessToken;
  final String? expDateTime;

  const LoginApiResponse({this.accessToken, this.expDateTime});

  factory LoginApiResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginApiResponseToJson(this);
}
