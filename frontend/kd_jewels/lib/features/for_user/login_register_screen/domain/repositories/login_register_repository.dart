import '../../data/model/sign_in_model.dart';
import '../../../../../core/api/api_result.dart';

abstract class LoginRegisterRepository {
  Future<ApiResult<SignInModel>> doSignIn(String? email, String? password);
}