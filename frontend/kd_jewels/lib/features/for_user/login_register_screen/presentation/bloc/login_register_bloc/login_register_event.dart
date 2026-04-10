part of 'login_register_bloc.dart';

@immutable
sealed class LoginRegisterEvent {}

class LogInRequested extends LoginRegisterEvent {
  final String email;
  final String password;

  LogInRequested(this.email, this.password);
}

