

import 'package:playground_flutter_project/core/base/base_mapper.dart';
import 'package:playground_flutter_project/data/apiresponse/auth/login_api_response.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/login_api_entity.dart';

class LoginApiMapper extends BaseMapper<LoginApiResponse, LoginApiEntity> {
  @override
  LoginApiEntity map(LoginApiResponse response) {
    return LoginApiEntity(
      accessToken: response.accessToken ?? "",
      expirationDateTime: response.expDateTime ?? "",
    );
  }
}
