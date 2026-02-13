import 'package:playground_flutter_project/core/base/base_mapper.dart';
import 'package:playground_flutter_project/data/apiresponse/auth/profile_api_response.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/profile_api_enity.dart';

class ProfileApiMapper extends BaseMapper<ProfileApiResponse, ProfileApiEnity> {
  @override
  ProfileApiEnity map(ProfileApiResponse response) {
    final data = response.data;
    final user = data?.user;
    final operator = user?.operator;

    // Get operator info
    final operatorId = operator?.id ?? "";
    final operatorName = operator?.name ?? "";
    final routes = user?.routes ?? [];

    // Get route info (first route if available)
    final routeId = (routes.isNotEmpty) ? routes.first.id ?? "" : "";
    final routeName = (routes.isNotEmpty) ? routes.first.name ?? "" : "";

    return ProfileApiEnity(
      countermanId: user?.id ?? "",
      countermanName:
          (user?.firstName ?? "") +
          (user?.lastName != null ? " ${user?.lastName}" : ""),
      countermanFirstName: user?.firstName ?? "",
      countermanLastName: user?.lastName ?? "",
      countermanPhone: user?.phone ?? "",
      countermanEmail: "", // Not present in UserModel
      countermanAvatar: "", // Not present in UserModel
      operatorId: operatorId,
      operatorName: operatorName,
      routeId: routeId,
      routeName: routeName,
      printerType: user?.printType ?? "",
      counterId: user?.counter?.id ?? "",
      counterName: user?.counter?.name ?? "",
      permissions: user?.permissions ?? [],
    );
  }
}
