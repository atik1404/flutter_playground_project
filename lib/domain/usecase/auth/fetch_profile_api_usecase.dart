import 'package:playground_flutter_project/core/base/base_use_case.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/profile_api_enity.dart';
import 'package:playground_flutter_project/domain/repositories/auth_repository.dart';

final class FetchProfileApiUseCase
    implements NoParamApiUseCase<ProfileApiEnity> {
  final AuthRepository _repository;

  const FetchProfileApiUseCase(this._repository);

  @override
  Future<Result<ProfileApiEnity>> invoke() async {
    final result = await _repository.fetchProfile();

    return result;
  }
}
