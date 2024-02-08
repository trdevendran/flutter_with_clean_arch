part of 'auth_bloc.dart';

@immutable
class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  const LoginEvent();
}

class UserNameTextChanged extends AuthEvent {
  final String userName;

  const UserNameTextChanged(this.userName);
}

class PasswordTextChanged extends AuthEvent {
  final String password;

  const PasswordTextChanged(this.password);
}

class ShowPasswordEvent extends AuthEvent {
  final bool showPassword;

  const ShowPasswordEvent(this.showPassword);
}

class AcknowledgeToAlert extends AuthEvent {

  const AcknowledgeToAlert();
}

class ForgotPasswordEvent extends AuthEvent {
  final String userName;

  const ForgotPasswordEvent(this.userName);
}

class LogoutEvent extends AuthEvent {
  final String token;

  const LogoutEvent(this.token);
}
