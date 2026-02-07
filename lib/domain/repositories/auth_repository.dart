
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/login_api_entity.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/profile_api_entity.dart';
import 'package:playground_flutter_project/domain/entities/params/login_params.dart';

abstract class AuthRepository {
  Future<Result<LoginApiEntity>> userLogin(LoginParams params);

  Future<Result<ProfileApiEntity>> fetchProfile();
}
