import '../repositories/login_register_repository.dart';

class LoginRegisterUseCase {
  final LoginRegisterRepository _loginRegisterRepository;

  LoginRegisterUseCase({required LoginRegisterRepository loginRegisterRepository})
      : _loginRegisterRepository = loginRegisterRepository;

}
