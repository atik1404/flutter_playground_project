import 'package:playground_flutter_project/core/base/response_transformer.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_pref_key.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_prefs.dart';
import 'package:playground_flutter_project/data/datasources/remote/auth_api_services.dart';
import 'package:playground_flutter_project/data/mappers/auth/login_api_mapper.dart';
import 'package:playground_flutter_project/data/mappers/auth/profile_api_mapper.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/login_api_entity.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/profile_api_entity.dart';
import 'package:playground_flutter_project/domain/entities/params/login_params.dart';
import 'package:playground_flutter_project/domain/repositories/auth_repository.dart';

final class AuthRepoImpl extends AuthRepository {
  final AuthApiServices _authApiServices;
  final LoginApiMapper _loginApiMapper;
  final ProfileApiMapper _profileApiMapper;
  final SharedPrefs _sharedPrefs;

  AuthRepoImpl({
    required AuthApiServices authApiServices,
    required LoginApiMapper loginApiMapper,
    required ProfileApiMapper profileApiMapper,
    required SharedPrefs sharedPrefs,
  }) : _authApiServices = authApiServices,
       _loginApiMapper = loginApiMapper,
       _profileApiMapper = profileApiMapper,
       _sharedPrefs = sharedPrefs;

  @override
  Future<Result<LoginApiEntity>> userLogin(LoginParams params) async {
    final response = await _authApiServices.userLogin(params);

    return ResponseTransformer().transform(
      response: response,
      mapper: _loginApiMapper,
    );
  }

  @override
  Future<Result<ProfileApiEntity>> fetchProfile() async {
    final response = await _authApiServices.fetchProfile();
    final result = ResponseTransformer().transform(
      response: response,
      mapper: _profileApiMapper,
    );

    if (result is SuccessResult<ProfileApiEntity>) {
      // Save user profile data to shared preferences
      final profile = result.data;
      _sharedPrefs
        ..set(key: SharedPrefKey.userId, value: profile.userId)
        ..set(key: SharedPrefKey.userEmail, value: profile.email)
        ..set(key: SharedPrefKey.userRole, value: profile.role)
        ..set(key: SharedPrefKey.avatar, value: profile.avatar)
        ..set(key: SharedPrefKey.fullName, value: profile.name);
    }

    return result;
  }
}
