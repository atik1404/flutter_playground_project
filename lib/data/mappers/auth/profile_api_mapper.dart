import 'package:playground_flutter_project/core/base/base_mapper.dart';
import 'package:playground_flutter_project/data/apiresponse/auth/profile_api_response.dart';
import 'package:playground_flutter_project/domain/entities/apientity/auth/profile_api_enity.dart';

class ProfileApiMapper extends BaseMapper<UserModel, ProfileApiEnity> {
  @override
  ProfileApiEnity map(UserModel response) {
    // Get operator info
    final operatorId = response.operator?.id ?? "";
    final operatorName = response.operator?.name ?? "";
    final routes = response.routes ?? [];

    // Get route info (first route if available)
    final routeId = (routes.isNotEmpty) ? routes.first.id ?? "" : "";
    final routeName = (routes.isNotEmpty) ? routes.first.name ?? "" : "";

    return ProfileApiEnity(
      countermanId: response.id ?? "",
      countermanName:
          (response.firstName ?? "") +
          (response.lastName != null ? " ${response.lastName}" : ""),
      countermanFirstName: response.firstName ?? "",
      countermanLastName: response.lastName ?? "",
      countermanPhone: response.phone ?? "",
      countermanEmail: "", // Not present in UserModel
      countermanAvatar: "", // Not present in UserModel
      operatorId: operatorId,
      operatorName: operatorName,
      routeId: routeId,
      routeName: routeName,
      printerType: response.printType ?? "",
      permissions: response.permissions ?? [],
    );
  }
}
