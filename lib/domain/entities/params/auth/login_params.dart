import 'package:playground_flutter_project/domain/entities/params/api_params_annotation.dart';
part 'login_params.g.dart';

@apiParamsAnnotation
class LoginParams {
  final String phone;
  final String password;

  const LoginParams({required this.phone, required this.password});

  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);
}
