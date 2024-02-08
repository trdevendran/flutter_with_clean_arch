import 'dart:async';

import '../../repositories/auth_repository.dart';

/// Contains all the use cases of the User module as a domain layer
/// to keep all the business cases of app users
class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  FutureOr<String?> doLogin(String username, String password) async {
    return await repository.doLogin(username, password);
  }

  FutureOr<void> forgotPassword(String username) {
    repository.forgotPassword(username);
  }

  FutureOr<void> doLogout(String token) {
    repository.doLogout(token);
  }
}
