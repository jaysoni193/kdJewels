part of 'login_register_bloc.dart';

@immutable
sealed class LoginRegisterEvent {}

class LogInEvent extends LoginRegisterEvent {
  final String email;
  final String password;

  LogInEvent(this.email, this.password);
}

