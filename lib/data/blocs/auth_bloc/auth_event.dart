part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpLoadedEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String phoneNo;
  const SignUpLoadedEvent(this.name, this.email, this.password, this.phoneNo);

  @override
  List<Object> get props => [name, email, password, phoneNo];
}

class LoginLoadedEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginLoadedEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
