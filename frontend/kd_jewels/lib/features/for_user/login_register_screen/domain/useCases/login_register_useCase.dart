import '../../presentation/page/login_register_widgets/sign_in_body_widget.dart';
import '../../../../../core/api/api_result.dart';
import '../../data/model/sign_in_model.dart';
import '../repositories/login_register_repository.dart';

class LoginRegisterUseCase {
  final LoginRegisterRepository _loginRegisterRepository;

  LoginRegisterUseCase({required LoginRegisterRepository loginRegisterRepository}) : _loginRegisterRepository = loginRegisterRepository;

  Future<ApiResult<SignInModel>> doSignIn(String? email, String? password) async {
    return await _loginRegisterRepository.doSignIn(email, password);
  }
}
