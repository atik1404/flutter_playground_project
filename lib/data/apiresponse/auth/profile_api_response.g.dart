// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileApiResponse _$ProfileApiResponseFromJson(Map<String, dynamic> json) =>
    ProfileApiResponse(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserProfileDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

UserProfileDataModel _$UserProfileDataModelFromJson(
  Map<String, dynamic> json,
) => UserProfileDataModel(
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  permissions: (json['permissions'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      (e as List<dynamic>)
          .map(
            (e) => PermissionCategoryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  ),
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  operator: json['operator'] == null
      ? null
      : OperatorModel.fromJson(json['operator'] as Map<String, dynamic>),
  routes: (json['routes'] as List<dynamic>?)
      ?.map((e) => RouteModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  counter: json['counter'] == null
      ? null
      : IdNameModel.fromJson(json['counter'] as Map<String, dynamic>),
  ticketLayout: json['ticketLayout'] == null
      ? null
      : IdNameModel.fromJson(json['ticketLayout'] as Map<String, dynamic>),
  printType: json['printType'] as String?,
  permissions: (json['permissions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  status: json['status'] as bool?,
);

OperatorModel _$OperatorModelFromJson(Map<String, dynamic> json) =>
    OperatorModel(id: json['id'] as String?, name: json['name'] as String?);

RouteModel _$RouteModelFromJson(Map<String, dynamic> json) =>
    RouteModel(id: json['id'] as String?, name: json['name'] as String?);

IdNameModel _$IdNameModelFromJson(Map<String, dynamic> json) =>
    IdNameModel(id: json['id'] as String?, name: json['name'] as String?);

PermissionCategoryModel _$PermissionCategoryModelFromJson(
  Map<String, dynamic> json,
) => PermissionCategoryModel(
  title: json['title'] as String?,
  buttonType: json['buttonType'] as String?,
  doc: (json['doc'] as List<dynamic>?)
      ?.map((e) => PermissionGroupModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

PermissionGroupModel _$PermissionGroupModelFromJson(
  Map<String, dynamic> json,
) => PermissionGroupModel(
  title: json['title'] as String?,
  doc: (json['doc'] as List<dynamic>?)
      ?.map((e) => PermissionItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

PermissionItemModel _$PermissionItemModelFromJson(Map<String, dynamic> json) =>
    PermissionItemModel(
      key: json['key'] as String?,
      value: json['value'] as String?,
      buttonType: json['buttonType'] as String?,
    );
