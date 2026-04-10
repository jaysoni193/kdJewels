import '../../../../../core/mixins/error_mixin.dart';
import '../../domain/repositories/login_register_repository.dart';
import '../datasources/login_register_remote_datasource.dart';

class LoginRegisterRepositoriesImpl with ErrorMixin implements LoginRegisterRepository {
  final LoginRegisterRemoteDatasource _loginRegisterRemoteDatasource;

  LoginRegisterRepositoriesImpl({required LoginRegisterRemoteDatasource loginRegisterRemoteDatasource}) : _loginRegisterRemoteDatasource = loginRegisterRemoteDatasource;

}
