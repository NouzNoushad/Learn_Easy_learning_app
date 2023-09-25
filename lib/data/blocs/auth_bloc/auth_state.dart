part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class SignUpLoadedState extends AuthState {
  final SignUpStatus signUpStatus;
  const SignUpLoadedState(this.signUpStatus);

  @override
  List<Object> get props => [signUpStatus];
}

class LoginLoadedState extends AuthState {
  final LoginStatus loginStatus;
  const LoginLoadedState(this.loginStatus);

  @override
  List<Object> get props => [loginStatus];
}

class AuthErrorState extends AuthState {
  final String error;
  const AuthErrorState(this.error);

  @override
  List<Object> get props => [error];
}
