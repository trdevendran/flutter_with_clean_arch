part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class LoginState extends AuthState {
  final String userName;
  final String password;
  final String message;

  LoginState({this.userName = '', this.password = '', this.message = ''});

  LoginState copyWith({String? userName, String? password, String? message}) {
    return LoginState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [userName, password, message];
}

class AuthSuccessState extends AuthState {
  final String authToken;

  AuthSuccessState(this.authToken);

  @override
  List<Object?> get props => [authToken];
}

class UnAuthState extends AuthState {
  @override
  List<Object?> get props => [];
}

class ForbiddenState extends AuthState {
  final String message;

  ForbiddenState(this.message);

  @override
  List<Object?> get props => [message];
}
