import 'package:playground_flutter_project/core/base/response_transformer.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/data/datasources/remote/auth_api_services.dart';
import 'package:playground_flutter_project/data/mappers/auth/login_api_mapper.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/login_api_entity.dart';
import 'package:playground_flutter_project/domain/entities/params/auth/login_params.dart';
import 'package:playground_flutter_project/domain/repositories/auth_repository.dart';

final class AuthRepoImpl extends AuthRepository {
  final AuthApiServices _authApiServices;
  final LoginApiMapper _loginApiMapper;

  AuthRepoImpl({
    required AuthApiServices authApiServices,
    required LoginApiMapper loginApiMapper,
  }) : _authApiServices = authApiServices,
       _loginApiMapper = loginApiMapper;

  @override
  Future<Result<LoginApiEntity>> userLogin(LoginParams params) async {
    final response = await _authApiServices.userLogin(params);

    return ResponseTransformer().transform(
      response: response,
      mapper: _loginApiMapper,
    );
  }

}
