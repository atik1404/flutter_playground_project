class LoginApiEntity {
  final String accessToken;
  final String expirationDateTime;

  const LoginApiEntity({
    required this.accessToken,
    required this.expirationDateTime,
  });
}
