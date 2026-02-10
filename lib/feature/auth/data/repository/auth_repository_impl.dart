import 'package:playground_flutter_project/feature/auth/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> login({required String email, required String password}) async {
    // Mock API call
    await Future.delayed(const Duration(seconds: 2));
    if (password == "error") {
      throw Exception("Invalid credentials");
    }
  }
}
