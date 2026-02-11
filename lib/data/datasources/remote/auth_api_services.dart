import 'package:playground_flutter_project/core/network/network_client.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/data/apiresponse/auth/login_api_response.dart';
import 'package:playground_flutter_project/data/apiresponse/auth/profile_api_response.dart';
import 'package:playground_flutter_project/domain/entities/params/auth/login_params.dart';

class AuthApiServices {
  final NetworkClient client;

  AuthApiServices({required this.client});

  Future<Result<LoginApiResponse>> userLogin(LoginParams params) {
    return client.post(
      "api/v1/user/login",
      data: params.toJson(),
      parseJson: (json) => LoginApiResponse.fromJson(json),
    );
  }

  Future<Result<ProfileApiResponse>> fetchProfile() {
    return client.get(
      "api/v1/user/profile",
      parseJson: (json) => ProfileApiResponse.fromJson(json),
    );
  }
}
