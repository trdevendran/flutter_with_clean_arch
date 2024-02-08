import 'dart:async';

/// Repository contains an abstract methods for all the repository based
/// operations for Auth module
abstract class AuthRepository {
  FutureOr<String?> doLogin(String username, String password);

  FutureOr<void> doLogout(String token);

  FutureOr<void> forgotPassword(String username) {}
}
