part of 'login_register_bloc.dart';

@immutable
sealed class LoginRegisterState {}

final class LoginRegisterInitial extends LoginRegisterState {}

class LoadingState extends LoginRegisterState {
  final bool? isLoading;

  LoadingState(this.isLoading);
}
class ErrorState extends LoginRegisterState {
  final String? error;

  ErrorState(this.error);
}
class LoginSuccessState extends LoginRegisterState {
  final SignInModel signInModel;
  final String? email;
  final String? password;

  LoginSuccessState(this.signInModel, this.email, this.password,);
}




