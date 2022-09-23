import '../models/user.dart';

abstract class AuthenticationRepo {
  Future<User?> login(String email, String password);
  Future<User?> register(String email, String password);
  Future<void> logout();
  Future<User?> currentUser();
}
