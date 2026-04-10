part of 'login_register_bloc.dart';

@immutable
sealed class LoginRegisterState {}

final class LoginRegisterInitial extends LoginRegisterState {}

class LoginLoadingState extends LoginRegisterState {}




