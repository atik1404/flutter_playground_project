import 'package:dio/dio.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/data/apiresponse/auth/login_api_response.dart';
import 'package:playground_flutter_project/data/apiresponse/auth/profile_api_response.dart';
import 'package:playground_flutter_project/data/datasources/remote/handle_api_call.dart';
import 'package:playground_flutter_project/domain/entities/params/login_params.dart';

class AuthApiServices {
  final Dio dio;

  AuthApiServices({required this.dio});

  Future<Result<LoginApiResponse>> userLogin(LoginParams params) {
    return handleApiResponse<LoginApiResponse>(
      () => dio.post("v1/auth/login", data: params.toJson()),
      (json) => LoginApiResponse.fromJson(json),
    );
  }

  Future<Result<ProfileApiResponse>> fetchProfile() {
    return handleApiResponse<ProfileApiResponse>(
      () => dio.get("v1/auth/profile"),
      (json) => ProfileApiResponse.fromJson(json),
    );
  }
}
