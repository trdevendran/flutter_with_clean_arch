import 'dart:async';

import '../../../core/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  FutureOr<String?> doLogin(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (username == "lions@gmail.com" && password == "Bot1234\$") {
      return "fvghbjnkmsdfghj.jhgfdsfghjkhgfdfghj.cvbhjihugyfybvcdfvgbnhvg";
    }
    return null;
  }

  @override
  FutureOr<void> forgotPassword(String username) {}

  @override
  FutureOr<void> doLogout(String token) {}
}
