import 'package:playground_flutter_project/core/base/base_use_case.dart';
import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/login_api_entity.dart';
import 'package:playground_flutter_project/domain/entities/params/auth/login_params.dart';
import 'package:playground_flutter_project/domain/repositories/auth_repository.dart';

final class PostLoginApiUsecase
    implements ApiUseCase<LoginParams, LoginApiEntity> {
  final AuthRepository _repository;

  const PostLoginApiUsecase(this._repository);

  @override
  Future<Result<LoginApiEntity>> invoke(LoginParams params) async {
    final result = await _repository.userLogin(params);

    return result;
  }
}
