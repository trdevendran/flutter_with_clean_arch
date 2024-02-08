import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/util/email_validator.dart';

import '../../core/domain/usecases/auth_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;

  AuthBloc(this.authUseCase) : super(UnAuthState()) {
    on<LoginEvent>(_onLoginEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<UserNameTextChanged>(_onUserNameTextChanged);
    on<PasswordTextChanged>(_onPasswordTextChanged);
    on<AcknowledgeToAlert>(_onAcknowledgeToAlert);
  }

  Future<FutureOr<void>> _onLoginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    if (state is LoginState) {
      var loginState = state as LoginState;
      if (loginState.userName.trim().isEmpty) {
        emit(loginState.copyWith(message: Constants.usernameEmpty));
      } else if (!EmailValidator.isValid(loginState.userName.trim())) {
        emit(loginState.copyWith(message: Constants.invalidMailError));
      } else if (loginState.password.isEmpty) {
        emit(loginState.copyWith(message: Constants.passwordEmpty));
      } else {
        var authToken =
            await authUseCase.doLogin(loginState.userName, loginState.password);
        if (authToken == null) {
          emit(loginState.copyWith(message: Constants.actionFailedError));
        } else {
          emit(AuthSuccessState(authToken));
        }
      }
    }
  }

  FutureOr<void> _onLogoutEvent(LogoutEvent event, Emitter<AuthState> emit) {}

  FutureOr<void> _onUserNameTextChanged(
      UserNameTextChanged event, Emitter<AuthState> emit) {
    if (state is LoginState) {
      var loginState = state as LoginState;
      emit(loginState.copyWith(userName: event.userName));
    } else {
      emit(LoginState(userName: event.userName, password: ''));
    }
  }

  FutureOr<void> _onPasswordTextChanged(
      PasswordTextChanged event, Emitter<AuthState> emit) {
    if (state is LoginState) {
      var loginState = state as LoginState;
      emit(loginState.copyWith(password: event.password));
    } else {
      emit(LoginState(userName: '', password: event.password));
    }
  }

  FutureOr<void> _onAcknowledgeToAlert(
      AcknowledgeToAlert event, Emitter<AuthState> emit) {
    if (state is LoginState) {
      var loginState = state as LoginState;
      emit(loginState.copyWith(message: ''));
    }
  }
}
