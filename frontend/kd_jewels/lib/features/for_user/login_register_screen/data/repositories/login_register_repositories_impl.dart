import 'package:kd_jewels/core/api/api_result.dart';

import 'package:kd_jewels/features/for_user/login_register_screen/data/model/sign_in_model.dart';

import '../../../../../core/mixins/error_mixin.dart';
import '../../domain/repositories/login_register_repository.dart';
import '../datasources/login_register_remote_datasource.dart';

class LoginRegisterRepositoriesImpl with ErrorMixin implements LoginRegisterRepository {
  final LoginRegisterRemoteDatasource _loginRegisterRemoteDatasource;

  LoginRegisterRepositoriesImpl({required LoginRegisterRemoteDatasource loginRegisterRemoteDatasource}) : _loginRegisterRemoteDatasource = loginRegisterRemoteDatasource;

  @override
  Future<ApiResult<SignInModel>> doSignIn(String? email, String? password) async {
    try {
      final response = await _loginRegisterRemoteDatasource.doSignIn(email, password);
      // Parse actual API JSON response
      final signInModel = SignInModel.fromJson(response.data);
      return ApiResult.success(data: signInModel);
    } catch (e) {
      return handleAPIError<SignInModel>(e);
    }
  }

}
