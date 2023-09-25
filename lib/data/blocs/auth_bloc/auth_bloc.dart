import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/data/repositories/auth_repository.dart';

import '../../../utils/constant.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({
    required this.authRepository,
  }) : super(AuthInitial()) {
    on<SignUpLoadedEvent>(signUpUser);
    on<LoginLoadedEvent>(loginUser);
  }

  FutureOr<void> signUpUser(
      SignUpLoadedEvent event, Emitter<AuthState> emit) async {
    try {
      SignUpStatus signUpStatus = await authRepository.createUserAccount(
          name: event.name,
          email: event.email,
          password: event.password,
          phoneNo: event.phoneNo);
      emit(SignUpLoadedState(signUpStatus));
    } catch (error) {
      emit(AuthErrorState(error.toString()));
    }
  }

  FutureOr<void> loginUser(
      LoginLoadedEvent event, Emitter<AuthState> emit) async {
    try {
      LoginStatus loginStatus =
          await authRepository.loginUser(event.email, event.password);
      emit(LoginLoadedState(loginStatus));
    } catch (error) {
      emit(AuthErrorState(error.toString()));
    }
  }
}
