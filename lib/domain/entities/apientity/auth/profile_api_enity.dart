final class ProfileApiEnity {
  final String countermanId;
  final String countermanName;
  final String countermanFirstName;
  final String countermanLastName;
  final String countermanPhone;
  final String countermanEmail;
  final String countermanAvatar;
  final String operatorId;
  final String operatorName;
  final String routeId;
  final String routeName;
  final String printerType;
  final String counterId;
  final String counterName;
  final List<String> permissions;

  ProfileApiEnity({
    required this.countermanId,
    required this.countermanName,
    required this.countermanFirstName,
    required this.countermanLastName,
    required this.countermanPhone,
    required this.countermanEmail,
    required this.countermanAvatar,
    required this.operatorId,
    required this.operatorName,
    required this.routeId,
    required this.routeName,
    required this.printerType,
    required this.counterId,
    required this.counterName,
    required this.permissions,
  });
}
