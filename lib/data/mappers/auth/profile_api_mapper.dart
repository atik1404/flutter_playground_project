import 'package:playground_flutter_project/core/base/base_mapper.dart';
import 'package:playground_flutter_project/data/apiresponse/auth/profile_api_response.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/profile_api_entity.dart';

class ProfileApiMapper
    extends BaseMapper<ProfileApiResponse, ProfileApiEntity> {
  @override
  ProfileApiEntity map(ProfileApiResponse response) {
    return ProfileApiEntity(
      userId: response.id ?? 0,
      name: response.name ?? "",
      email: response.email ?? "",
      avatar: response.avatar ?? "",
      role: response.role ?? "",
    );
  }
}
