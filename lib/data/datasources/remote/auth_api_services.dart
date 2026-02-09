import 'package:playground_flutter_project/core/network/network_client.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/data/apiresponse/auth/login_api_response.dart';
import 'package:playground_flutter_project/domain/entities/params/login_params.dart';

class AuthApiServices {
  final NetworkClient client;

  AuthApiServices({required this.client});

  Future<Result<LoginApiResponse>> userLogin(LoginParams params) {
    return client.post(
      "v1/auth/login",
      data: params.toJson(),
      parseJson: (json) => LoginApiResponse.fromJson(json),
    );
  }
}
