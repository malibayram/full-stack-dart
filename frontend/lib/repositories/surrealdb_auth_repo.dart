import '../models/index.dart';
import 'authentication_repo.dart';

class SurrealdbAuthRepo implements AuthenticationRepo {
  @override
  Future<User?> currentUser() async {
    return null;
  }

  @override
  Future<User?> login(String email, String password) async {
    return null;
  }

  @override
  Future<void> logout() async {}

  @override
  Future<User?> register(String email, String password) async {
    return null;
  }
}
