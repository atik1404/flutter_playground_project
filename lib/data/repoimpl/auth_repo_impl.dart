import 'package:get_it/get_it.dart';
import 'package:playground_flutter_project/core/base/response_transformer.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_pref_key.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_prefs.dart';
import 'package:playground_flutter_project/data/datasources/remote/auth_api_services.dart';
import 'package:playground_flutter_project/data/mappers/auth/login_api_mapper.dart';
import 'package:playground_flutter_project/data/mappers/auth/profile_api_mapper.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/login_api_entity.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/profile_api_enity.dart';
import 'package:playground_flutter_project/domain/entities/params/auth/login_params.dart';
import 'package:playground_flutter_project/domain/repositories/auth_repository.dart';

final class AuthRepoImpl extends AuthRepository {
  final AuthApiServices _authApiServices;
  final LoginApiMapper _loginApiMapper;
  final ProfileApiMapper _profileApiMapper;
  final SharedPrefs _sharedPrefs = GetIt.I.get<SharedPrefs>();

  AuthRepoImpl({
    required AuthApiServices authApiServices,
    required LoginApiMapper loginApiMapper,
    required ProfileApiMapper profileApiMapper,
  }) : _authApiServices = authApiServices,
       _loginApiMapper = loginApiMapper,
       _profileApiMapper = profileApiMapper;

  @override
  Future<Result<LoginApiEntity>> userLogin(LoginParams params) async {
    final response = await _authApiServices.userLogin(params);
    final result = ResponseTransformer().transform(
      response: response,
      mapper: _loginApiMapper,
    );

    if (result is Success<LoginApiEntity>) {
      final token = result.data.accessToken;
      _sharedPrefs
        ..set(key: SharedPrefKey.accessToken, value: token)
        ..set(
          key: SharedPrefKey.refreshToken,
          value: result.data.expirationDateTime,
        )
        ..set(key: SharedPrefKey.userLoggedInStatus, value: true);
    }

    return result;
  }

  @override
  Future<Result<ProfileApiEnity>> fetchProfile() async {
    final response = await _authApiServices.fetchProfile();

    final result = ResponseTransformer().transform(
      response: response,
      mapper: _profileApiMapper,
    );

    if (result is Success<ProfileApiEnity>) {
      final profile = result.data;
      _sharedPrefs
        ..set(key: SharedPrefKey.fullName, value: profile.countermanName)
        ..set(key: SharedPrefKey.countermanId, value: profile.countermanId)
        ..set(key: SharedPrefKey.avatar, value: profile.countermanAvatar)
        ..set(key: SharedPrefKey.operatorId, value: profile.operatorId)
        ..set(key: SharedPrefKey.operatorName, value: profile.operatorName);
    }

    return result;
  }
}
