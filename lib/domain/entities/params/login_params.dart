import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_params.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginParams {
  final String phone;
  final String password;

  const LoginParams({required this.phone, required this.password});

  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);
}
