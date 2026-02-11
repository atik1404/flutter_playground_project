import 'package:playground_flutter_project/data/apiresponse/api_response_annotation.dart';

part 'profile_api_response.g.dart';

@apiResponse
class ProfileApiResponse {
  final int? statusCode;
  final String? message;
  final UserProfileDataModel? data;

  ProfileApiResponse({this.statusCode, this.message, this.data});

  factory ProfileApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiResponseFromJson(json);
}

@apiResponse
class UserProfileDataModel {
  final UserModel? user;

  /// Example: { "COUNTERMAN": [ ... ] }
  final Map<String, List<PermissionCategoryModel>>? permissions;

  UserProfileDataModel({this.user, this.permissions});

  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataModelFromJson(json);
}

@apiResponse
class UserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? role;
  final OperatorModel? operator;
  final List<RouteModel>? routes;
  final IdNameModel? counter;
  final IdNameModel? ticketLayout;
  final String? printType;
  final List<String>? permissions;
  final bool? status;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.role,
    this.operator,
    this.routes,
    this.counter,
    this.ticketLayout,
    this.printType,
    this.permissions,
    this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@apiResponse
class OperatorModel {
  final String? id;
  final String? name;

  OperatorModel({this.id, this.name});

  factory OperatorModel.fromJson(Map<String, dynamic> json) =>
      _$OperatorModelFromJson(json);
}

@apiResponse
class RouteModel {
  final String? id;
  final String? name;

  RouteModel({this.id, this.name});

  factory RouteModel.fromJson(Map<String, dynamic> json) =>
      _$RouteModelFromJson(json);
}

@apiResponse
class IdNameModel {
  final String? id;
  final String? name;

  IdNameModel({this.id, this.name});

  factory IdNameModel.fromJson(Map<String, dynamic> json) =>
      _$IdNameModelFromJson(json);
}

@apiResponse
class PermissionCategoryModel {
  final String? title;
  final String? buttonType;
  final List<PermissionGroupModel>? doc;

  PermissionCategoryModel({this.title, this.buttonType, this.doc});

  factory PermissionCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionCategoryModelFromJson(json);
}

@apiResponse
class PermissionGroupModel {
  final String? title;
  final List<PermissionItemModel>? doc;

  PermissionGroupModel({this.title, this.doc});

  factory PermissionGroupModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionGroupModelFromJson(json);
}

@apiResponse
class PermissionItemModel {
  final String? key;
  final String? value;
  final String? buttonType;

  PermissionItemModel({this.key, this.value, this.buttonType});

  factory PermissionItemModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionItemModelFromJson(json);
}
